require './../lib/vistarpc4r/rpc_response'
require './../lib/vistarpc4r/vista_rpc'
require './../lib/vistarpc4r/rpc_broker_connection'

# Medsphere maintains a public demo OpenVistA server.  It resets all of its content every night.
# Info here ---> https://medsphere.org/docs/DOC-1003


broker = VistaRPC4r::RPCBrokerConnection.new('openvista.medsphere.org', 9201, 'PU1234', 'PU1234!!')

broker.connect
broker.setContext('OR CPRS GUI CHART')

patient_ien = "4"
wardsarray = broker.call_a("ORQPT WARDS")
wardsarray.each do |ward|
  a = ward.split("^")
  puts "Ward:" + a[1]
  wardarray = broker.call_a("ORQPT WARD PATIENTS", [a[0]])  # ward ien
  wardarray.each do |patient|
    b = patient.split("^")
    puts b[0] + ":" + b[1]
  end
end

# Problem list
puts "Problem list-------------------------------------"
patientarray = broker.call_a("ORQQPL LIST", [patient_ien, "A"])
patientarray.each do |d|
  puts d
end

# Medications
puts "Medications-------------------------------------"
patientarray = broker.call_a("ORWPS COVER", [patient_ien])
patientarray.each do |d|
  puts d
end

#Labs
puts "Labs-------------------------------------"
patientarray = broker.call_a("ORWCV LAB", [patient_ien])
patientarray.each do |d|
  puts d
end

# Vitals
puts "Vitals-------------------------------------"
patientarray = broker.call_a("ORQQVI VITALS", [patient_ien])
patientarray.each do |d|
  puts d
end

# Demo
puts "Demographics-------------------------------------"
patientarray = broker.call_a("ORWPT PTINQ", [patient_ien])
patientarray.each do |d|
  puts d
end

#visits
puts "Visits-------------------------------------"
patientarray = broker.call_a("ORWCV VST", [patient_ien])
patientarray.each do |d|
  puts d
end

#providers
puts "Providers---------------------------------"
patientarray = broker.call_a("ORQPT PROVIDERS")
patientarray.each do |d|
  puts d
end
