<Request>
  <Email email="tylern@jlab.org" request="false" job="true"/>
  <Project name="e1d"/>
  <Track name="analysis"/>
  <Name name="e1d_nt10maker"/>
  <Memory space="512" unit="MB"/>
  <TimeLimit unit="minutes" time="10"/>

  <Command><![CDATA[
    /home/tylern/e1d_nt10.sh
  ]]></Command>

  <List name="files">
r22848_00
r22848_11
r22853_00
r22853_01
r22853_02
  </List>

  <ForEach list="files">
    <Job>
      <Input src="mss:/mss/clas/e1d/production/pass2/v2/data/${files}.B00" dest="infile.B00"/>
      <Output src="outfile.hbook" dest="/volatile/clas/clase1/tylern/e1d_hbook/${files}.hbook" />
      <Stdout dest="/home/tylern/batch_log_files/${files}.stdout" />
      <Stderr dest="/home/tylern/batch_log_files/${files}.stderr" />
    </Job>
  </ForEach>

</Request>
