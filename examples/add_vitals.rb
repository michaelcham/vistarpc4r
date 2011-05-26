require 'rubygems'
require 'vistarpc4r'

broker = VistaRPC4r::RPCBrokerConnection.new('openvista.medsphere.org', 9201, 'PU1234', 'PU1234!!', false)

broker.connect
broker.setContext('OR CPRS GUI CHART')

#wardsrpc = VistaRPC4r::VistaRPC.new("ORQPT WARDS", VistaRPC4r::RPCResponse::ARRAY)
#wardsresponse = broker.execute(wardsrpc)
#wardsresponse.value.each do |d|
#  puts d
#end


# preset some variables
dfn = "4"  # internal id of the patient, CLINICAL, Male
provider ="42"  #internal id of care provider Physican, User
location = "1"  # hospital location  ICU=1 MED/SURG=2 PSYCH=3
thedate = "3110525"
thedatetime = "3110525.160100"
# Vitals
puts "Vitals-------------------------------------"
patientrpc = VistaRPC4r::VistaRPC.new("ORQQVI VITALS", VistaRPC4r::RPCResponse::ARRAY)
patientrpc.params[0]=dfn #patient ien
patientresponse = broker.execute(patientrpc)
patientresponse.value.each do |d|
  puts d
end

#  Add a new problem
vrpc = VistaRPC4r::VistaRPC.new("ORQQVI2 VITALS VAL & STORE", VistaRPC4r::RPCResponse::ARRAY)
vrpc.params[0] = [
                  ["1", "VST^DT^#{thedatetime}"],  # Vital date
                  ["2", "VST^PT^#{dfn}"], # Patient
                  ["3", "VST^HL^#{location}"], # location
                  ["4", "VIT^BP^^^120/60^#{provider}^^#{thedatetime}"]
                 ]
resp=broker.execute(vrpc)
puts resp

puts "Vitals-------------------------------------"
patientrpc = VistaRPC4r::VistaRPC.new("ORQQVI VITALS", VistaRPC4r::RPCResponse::ARRAY)
patientrpc.params[0]=dfn #patient ien
patientresponse = broker.execute(patientrpc)
patientresponse.value.each do |d|
  puts d
end
