# How to deploy java files On Oracle E-Business Suite 12.2.X

> cd $JAVA_TOP

> zip -r demasy demasy

> adjava oracle.apps.ad.jri.adjmx -areas $JAVA_TOP/demasy.zip -outputFile $JAVA_TOP/demasy.jar -jar

> cp -rf demasy.jar demasy.zip /u02/oracle/fs1/EBSapps/comn/java/classes

<br>

Restart oacore Server

> admanagedsrvctl.sh stop oacore_server1

> admanagedsrvctl.sh start oacore_server1
