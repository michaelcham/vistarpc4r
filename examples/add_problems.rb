require 'rpc_broker_connection'

#broker = RPCBrokerConnection.new('192.168.1.20', 9270, 'sys.admin', 'vista!123')
broker = RPCBrokerConnection.new('openvista.medsphere.org', 9201, 'PU1234', 'PU1234!!', false)

broker.connect
broker.setContext('OR CPRS GUI CHART')

dfn = "4"  # internal id of the patient, CLINICAL, Male
provider ="42"  #internal id of care provider Physican, User
# Problem list
puts "Problem list-------------------------------------"
vrpc = VistaRPC.new("ORQQPL LIST", RPCResponse::ARRAY)
vrpc.params[0]=dfn #patient ien
vrpc.params[1]="A"
resp = broker.execute(vrpc)
resp.value.each do |d|
  puts d
end

# Get Basic patient information that is used for problem list modification RPCs
vrpc = VistaRPC.new("ORQQPL INIT PT", RPCResponse::ARRAY)
vrpc.params[0]=dfn
resp = broker.execute(vrpc)
ptVAMC=resp.value[0]  #             := copy(Alist[i],1,999);
ptDead=resp.value[1]  #             := AList[i];
ptBID=resp.value[6]   #             := Alist[i];
ptname=""
gmpdfn = dfn + "^" + ptname + "^" + ptBID + "^" + ptDead
puts gmpdfn

#  Add a new problem
vrpc = VistaRPC.new("ORQQPL ADD SAVE", RPCResponse::ARRAY)
vrpc.params[0]=gmpdfn
vrpc.params[1]= provider
vrpc.params[2]= ptVAMC
vrpc.params[3] = [
                  ["1", "GMPFLD(.01)=\"\"\"819.01\"\"\""],  # Diagnosis
                  ["2", "GMPFLD(.05)=\"\"\"^nietest\"\"\""], # Narrative
                  ["3", "GMPFLD(.12)=\"\"\"A\"\"\""], # status  A?
                  ["4", "GMPFLD(.13)=\"\"\"\"\"\""], # Date of onset
                  ["5", "GMPFLD(1.01)=\"\"\"\"\"\""], # Problem
                  ["6", "GMPFLD(10,0)=\"\"\"\"\"\""] # Note
                 ]
resp=broker.execute(vrpc)
puts resp

vrpc = VistaRPC.new("ORQQPL LIST", RPCResponse::ARRAY)
vrpc.params[0]=dfn #patient ien
vrpc.params[1]="A"
resp = broker.execute(vrpc)
resp.value.each do |d|
  puts d
end

#vrpc = VistaRPC.new("ORQQPL DELETE", RPCResponse::SINGLE_VALUE)
#vrpc.params[0]="34"
#vrpc.params[1]=provider
#vrpc.params[2]=ptVAMC
#vrpc.params[3]="Because"
#resp=broker.execute(vrpc)
#puts resp
