require 'rpc_broker_connection'

#broker = RPCBrokerConnection.new('192.168.1.20', 9270, 'sys.admin', 'vista!123')
broker = RPCBrokerConnection.new('openvista.medsphere.org', 9201, 'PU1234', 'PU1234!!')

broker.connect
broker.setContext('OR CPRS GUI CHART')

wardsrpc = VistaRPC.new("ORQPT WARDS", RPCResponse::ARRAY)
wardsresponse = broker.execute(wardsrpc)
wardsresponse.value.each do |ward|
  a = ward.split("^")
  puts "Ward:" + a[1]
  wardrpc = VistaRPC.new("ORQPT WARD PATIENTS", RPCResponse::ARRAY)
  wardrpc.params[0]=a[0] #ward ien
  wardresponse = broker.execute(wardrpc)
  wardresponse.value.each do |patient|
    b = patient.split("^")
    puts b[0] + ":" + b[1]
  end
end

# Problem list
puts "Problem list-------------------------------------"
patientrpc = VistaRPC.new("ORQQPL LIST", RPCResponse::ARRAY)
patientrpc.params[0]="4" #patient ien
patientrpc.params[1]="A" #patient ien
patientresponse = broker.execute(patientrpc)
patientresponse.value.each do |d|
  puts d
end

# Medications
puts "Medications-------------------------------------"
patientrpc = VistaRPC.new("ORWPS COVER", RPCResponse::ARRAY)
patientrpc.params[0]="4" #patient ien
patientresponse = broker.execute(patientrpc)
patientresponse.value.each do |d|
  puts d
end

#Labs
puts "Labs-------------------------------------"
patientrpc = VistaRPC.new("ORWCV LAB", RPCResponse::ARRAY)
patientrpc.params[0]="4" #patient ien
patientresponse = broker.execute(patientrpc)
patientresponse.value.each do |d|
  puts d
end

# Vitals
puts "Vitals-------------------------------------"
patientrpc = VistaRPC.new("ORQQVI VITALS", RPCResponse::ARRAY)
patientrpc.params[0]="4" #patient ien
patientresponse = broker.execute(patientrpc)
patientresponse.value.each do |d|
  puts d
end

# Demo
puts "Demographics-------------------------------------"
patientrpc = VistaRPC.new("ORWPT PTINQ", RPCResponse::ARRAY)
patientrpc.params[0]="4" #patient ien
patientresponse = broker.execute(patientrpc)
patientresponse.value.each do |d|
  puts d
end

#visits
puts "Visits-------------------------------------"
patientrpc = VistaRPC.new("ORWCV VST", RPCResponse::ARRAY)
patientrpc.params[0]="4" #patient ien
patientresponse = broker.execute(patientrpc)
patientresponse.value.each do |d|
  puts d
end

#providers
puts "Providers---------------------------------"
patientrpc = VistaRPC.new("ORQPT PROVIDERS", RPCResponse::ARRAY)
patientresponse = broker.execute(patientrpc)
patientresponse.value.each do |d|
  puts d
end
