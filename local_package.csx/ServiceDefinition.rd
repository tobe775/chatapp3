<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="chatapp2" generation="1" functional="0" release="0" Id="ede2afb0-eeaa-47e4-a6d1-bd795e6f8b61" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="chatapp2Group" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="WorkerRole1:HttpIn" protocol="tcp">
          <inToChannel>
            <lBChannelMoniker name="/chatapp2/chatapp2Group/LB:WorkerRole1:HttpIn" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="WorkerRole1Instances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/chatapp2/chatapp2Group/MapWorkerRole1Instances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:WorkerRole1:HttpIn">
          <toPorts>
            <inPortMoniker name="/chatapp2/chatapp2Group/WorkerRole1/HttpIn" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapWorkerRole1Instances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/chatapp2/chatapp2Group/WorkerRole1Instances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="WorkerRole1" generation="1" functional="0" release="0" software="C:\node\chatapp2\local_package.csx\roles\WorkerRole1" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="HttpIn" protocol="tcp" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;WorkerRole1&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;WorkerRole1&quot;&gt;&lt;e name=&quot;HttpIn&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/chatapp2/chatapp2Group/WorkerRole1Instances" />
            <sCSPolicyUpdateDomainMoniker name="/chatapp2/chatapp2Group/WorkerRole1UpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/chatapp2/chatapp2Group/WorkerRole1FaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="WorkerRole1UpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="WorkerRole1FaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="WorkerRole1Instances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="9022065c-9343-415e-853e-2f7b9d0bb118" ref="Microsoft.RedDog.Contract\ServiceContract\chatapp2Contract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="bd7955de-6013-4851-8c57-3f313c8717a9" ref="Microsoft.RedDog.Contract\Interface\WorkerRole1:HttpIn@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/chatapp2/chatapp2Group/WorkerRole1:HttpIn" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>