# Oracle FNDLOAD Scripts

The Generic Loader (FNDLOAD) is a concurrent program that can move Oracle E-Business Suite data between database and text file representations. The loader reads a configuration file to determine what data to access. For information on specific configuration files consult the Open Interfaces Guide for your product group. The following sections describe the operation of the Generic Loader.

<br>


## FNDLOAD Syntax 

The Generic Loader is a concurrent program named FNDLOAD. The concurrent executable takes the following parameters:

> **FNDLOAD apps/{APPS_PASSWORD} 0 Y  {mode} {configfile} {datafile} {entity} [optional {param} {param}]**

<br>

## Naming Conventions

##### FNDLOAD Syntax 
> **FNDLOAD apps/{APPS_PASSWORD} 0 Y  {mode} {configfile} {datafile} {entity} [optional {param} {param}]**
> 
This is my recommended naming conventions for the data file name.

 | SEQ       | Type                   | Name                           | Prefix | Suffix | Example |
 | :-:       | :----------            | :----                          | :---   | :---   | :----   |
 | 1         | Responsibility         | XXDL_RESPONSIBILITY_NAME       | resp_  |   -     | resp_XXDL_RESPONSIBILITY_NAME.ldt |
 | 2         | Menu                   | XXDL_MENU_NAME                 | mu_    |   -     | mu_XXDL_MENU_NAME.ldt |
 | 3         | Function               | XXDL_FUNCTION_NAME             | func_  |   -     | func_XXDL_FUNCTION_NAME.ldt |  
 |           | **Concurrent Program**                                  | -      |  -      |  -      | -|
 | 4         | Program                | XXDL_CONCURRENT_PROGRAM        | prog_  |   -     | prog_XXDL_CONCURRENT_PROGRAM.ldt |
 | 5         | Request Groups         | XXDL_REQUEST_GROUP             | rg_    |   -     | rg_XXDL_REQUEST_GROUP.ldt |
 | 6         | Request Set & Link     | XXDL_REQUEST_SET               | rs_    |   -     | rs_XXDL_REQUEST_SET.ldt | 
 | 7         | Lookups                | XXDL_LOOKUP_TYPE               | lu_    |   -     | lu_XXDL_LOOKUP_TYPE.ldt |
 | 8         | Messages               | XXDL_MESSAGE_NAME              | msg_   |   -     | msg_XXDL_MESSAGE_NAME.ldt |
 |           | **Flexfields Setup**   | -                              | -      |   -     | - |
 | 9         | Value Set              | XXDL_VALUE_SET_NAME            | vs_    |   -     | vs_XXDL_VALUE_SET_NAME.ldt |
 | 10        | Descriptive flexfields | XXDL_DFF_FLEXFIELD_NAME        | df_    |   -     | df_XXDL_DFF_FLEXFIELD_NAME.ldt |
 | 11        | Key flexfields         | XXDL_KFF_FLEXFIELD_NAME        | kf_    |   -     | kf_XXDL_KFF_FLEXFIELD_NAME.ldt |
 | 12        | Profile                | XXDL_PROFILE_NAME              | pf_    |   -     | pf_XXDL_PROFILE_NAME.ldt |
 | 13        | Profile Value          | XXDL_PROFILE_VALUE             | pv_    |   -     | pv_XXDL_PROFILE_VALUE.ldt | 
 | 14        | Alert                  | XXDL_ALERT_NAME                | alr_   |   -     | alr_XXDL_ALERT_NAME.ldt |
 | 15        | Definition & Associated Template | XXDL_DATA_DEFINITION    | ddt_   |   -     | ddt_XXDL_DATA_DEFINITION.ldt | 
 | 16        | Data Template - Data Source XML File | XXDL_DATA_TEMPLATE| dtds_  |   -     | dtds_XXDL_DATA_TEMPLATE.ldt |  
 | 17        | Workflow               | XXDLWF                         | wf_    |   -     | wf_XXDLWF.wft |
 | 18        | Users                  | XXDL_DEMASY_LABS               | u_     |   -     | u_DEMASY_LABS.ldt | 
 
 <br>

## **FNDLOAD Entities** 
| Code      | Entity Name                           | Notes   |
| :-:       | :--------                         | :--------------------------   |
| 1         | **Oracle Application Object Library**                   | -       |
| 1         | Concurrent program definitions                   | -       |
| 2         | Request groups                    | -       |
| 3         | Lookup types and lookup values                  | -       |
| 4         | Flexfields setup data             | -       |
| 5         | Attachments definitions           | -       |
| 6         | Messages                          | -       |
| 7         | Security information              | -       |
 

<br>
 
## Concurrent Program

### Program

| Entity      | Sub-entities, if any |  #   | Download Parameters   |
| :----       | :--------            | :--: | :----   |
| PROGRAM     | INCOMPATIBILITY      | 1    |CONCURRENT_PROGRAM_NAME    |
|             |                      | 2    | APPLICATION_SHORT_NAME    |

### Executable

| Entity      | Sub-entities, if any |  #   | Download Parameters   |
| :----       | :--------            | :--: | :----   |
| EXECUTABLE  |          -           | 1    |EXECUTABLE_NAME    |


<br>

### Example

###### Download 

```
FNDLOAD apps/<$APPS_PWD> O Y DOWNLOAD $FND_TOP/patch/115/import/afcpprog.lct prog_XXDL_CONCURRENT_PROGRAM.ldt PROGRAM APPLICATION_SHORT_NAME="XXDL" CONCURRENT_PROGRAM_NAME="XXDL_CONCURRENT_PROGRAM"
```

###### Upload

```
FNDLOAD apps/<$APPS_PWD> 0 Y UPLOAD $FND_TOP/patch/115/import/afcpprog.lct prog_XXDL_CONCURRENT_PROGRAM.ldt - WARNING=YES UPLOAD_MODE=REPLACE CUSTOM_MODE=FORCE
```

<br>
 
## Request Groups
| Entity      | Sub-entities, if any |  #   | Download Parameters   |
| :----       | :--------            | :--: | :----   |
| REQUEST_GROUP  |          REQUEST_GROUP_ UNIT           | 1    |REQUEST_GROUP_UNIT    |
|   |                    | 2    |REQUEST_GROUP_NAME    |

### Example

###### Download 

```
apps/<$APPS_PWD> O Y DOWNLOAD $FND_TOP/patch/115/import/afcpreqg.lct reqg_XXDL_REPORT_GROUP.ldt REQUEST_GROUP REQUEST_GROUP_NAME="XXDL_REPORT_GROUP" APPLICATION_SHORT_NAME="XXDL"
```

###### Upload

```
FNDLOAD apps/<$APPS_PWD> O Y UPLOAD $FND_TOP/patch/115/import/afcpreqg.lct reqg_XXDL_REPORT_GROUP.ldt
```

<br>
 
## Lookups
| Entity           | Sub-entities, if any |  #   | Download Parameters   |
| :----            | :--------            | :--: | :----   |
| FND_LOOKUP_TYPE  |         FND_LOOKUP_VALUE           | 1    | 	VIEW_APPSNAME LOOKUP_TYPE    |
|                  |                                    | 2    |SECURITY_GROUP    |

<br>

### Example


###### Download 

```
FNDLOAD apps/<$APPS_PWD> O Y DOWNLOAD $FND_TOP/patch/115/import/aflvmlu.lct lu_XXDL_LOOKUP_TYPE.ldt FND_LOOKUP_TYPE APPLICATION_SHORT_NAME="XXDL" LOOKUP_TYPE="XXDL_LOOKUP_TYPE"
```

###### Upload

```
FNDLOAD apps/<$APPS_PWD> O Y UPLOAD $FND_TOP/patch/115/import/aflvmlu.lct lu_XXDL_LOOKUP_TYPE.ldt UPLOAD_MODE=REPLACE CUSTOM_MODE=FORCE
```

<br>
 
## Attachments Setup Data
| Entity      | Sub-entities, if any                           | Download Parameters   |
| :----      | :--------                         | :----   |
| FND_ATTACHMENT_ FUNCTIONS         | FND_ATTACHMENT_BLOCKS                   | APPLICATION_ SHORT_NAME      |


<br>
 
## Flexfields Setup
| Entity      | Sub-entities, if any                           | Download Parameters   |
| :----      | :--------                         | :----   |
| XXXXXXXXXXX         | XXXXXXXXXXX                   | XXXXXXXXXXX    |
 
 
<br>
 
## Folders
| Entity      | Sub-entities, if any                           | Download Parameters   |
| :----      | :--------                         | :----   |
| XXXXXXXXXXX         | XXXXXXXXXXX                   | XXXXXXXXXXX    |
 


<br>
 
## Messages
| Entity      | Sub-entities, if any                           | Download Parameters   |
| :----      | :--------                         | :----   |
| XXXXXXXXXXX         | XXXXXXXXXXX                   | XXXXXXXXXXX    |


<br>
 
## Profile Options & Profile Values
| Entity      | Sub-entities, if any                           | Download Parameters   |
| :----      | :--------                         | :----   |
| XXXXXXXXXXX         | XXXXXXXXXXX                   | XXXXXXXXXXX    |



<br>
 
## Security Information
| Entity      | Sub-entities, if any                           | Download Parameters   |
| :----      | :--------                         | :----   |
| XXXXXXXXXXX         | XXXXXXXXXXX                   | XXXXXXXXXXX    |


<br>

<br>

## **FNDLOAD**

| Code      | FNDLOAD                           | Notes   |
| :-:       | :--------                         | :----   |
| 1         | Alert                   | -       |
| 2         | Profile Option                   | -       |



<br> 


## FNDLOAD Alerts
 
###### Download  

```
FNDLOAD apps/<$APPS_PWD> 0 Y DOWNLOAD $ALR_TOP/patch/115/import/alr.lct alr_XXDL_ALERT_NAME.ldt ALR_ALERTS APPLICATION_SHORT_NAME="XXDL" ALERT_NAME="XXDL_ALERT_NAME"
```

###### Upload 
 
```
FNDLOAD apps/<$APPS_PWD> 0 Y UPLOAD $ALR_TOP/patch/115/import/alr.lct alr_XXDL_ALERT_NAME.ldt CUSTOM_MODE=FORCE
```

<br>

## FNDLOAD Profile

###### Download 

```
FNDLOAD apps/<$APPS_PWD> O Y DOWNLOAD $FND_TOP/patch/115/import/afscprof.lct prof_XXDL_PROFILE_OPTION.ldt PROFILE PROFILE_NAME="XXDL_PROFILE_OPTION" APPLICATION_SHORT_NAME="XXDL"
```

###### Upload

```
$FND_TOP/bin/FNDLOAD apps/<$APPS_PWD> 0 Y UPLOAD $FND_TOP/patch/115/import/afscprof.lct prof_XXDL_PROFILE_OPTION.ldt - WARNING=YES UPLOAD_MODE=REPLACE CUSTOM_MODE=FORCE
```



<br>

##  FNDLOAD Data Definition / Associated Template


###### Download 

```
FNDLOAD apps/<$APPS_PWD> O Y DOWNLOAD $XDO_TOP/patch/115/import/xdotmpl.lct xdo_XXDL_DATA_DEFINITION.ldt XDO_DS_DEFINITIONS APPLICATION_SHORT_NAME='XXDL' DATA_SOURCE_CODE='XXDL_DATA_DEFINITION' TMPL_APP_SHORT_NAME='XXDL' TEMPLATE_CODE='XXDL_DATA_DEFINITION'
```

###### Upload

```
FNDLOAD apps/<$APPS_PWD> O Y UPLOAD $XDO_TOP/patch/115/import/xdotmpl.lct xdo_XXDL_DATA_DEFINITION.ldt
```

<br>

## FNDLOAD Data Template - Data Source XML File

###### Download 

> java oracle.apps.xdo.oa.util.XDOLoader DOWNLOAD -DB_USERNAME apps -DB_PASSWORD apps -JDBC_CONNECTION '(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=XX_HOST_NAME)(PORT=XX_PORT_NUMBER))(CONNECT_DATA=(SERVICE_NAME=XX_SERVICE_NAME)))' -LOB_TYPE DATA_TEMPLATE -LOB_CODE XX_TEMPLATE -APPS_SHORT_NAME XXCUST -LANGUAGE en -lct_FILE $XDO_TOP/patch/115/import/xdotmpl.lct -LOG_FILE $LOG_FILE_NAME

###### Upload

> java oracle.apps.xdo.oa.util.XDOLoader UPLOAD -DB_USERNAME apps -DB_PASSWORD apps -JDBC_CONNECTION '(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=XX_HOST_NAME)(PORT=XX_PORT_NUMBER))(CONNECT_DATA=(SERVICE_NAME=XX_SERVICE_NAME)))' -LOB_TYPE DATA_TEMPLATE -LOB_CODE XX_TEMPLATE -XDO_FILE_TYPE XML -FILE_NAME $DATA_FILE_PATH/$DATA_FILE_NAME.xml -APPS_SHORT_NAME XXCUST -NLS_LANG en -TERRITORY US -LOG_FILE $LOG_FILE_NAME

<br>

## FNDLOAD Descriptive Flexfields


###### Download 

> $FND_TOP/bin/FNDLOAD apps/<APPS_PWD> 0 Y DOWNLOAD $FND_TOP/patch/115/import/afffload.lct XXCUST_DFF.ldt DESC_FLEX APPLICATION_SHORT_NAME="PO" DESCRIPTIVE_FLEXFIELD_NAME='PO_REQUISITION_HEADERS'

> FNDLOAD apps/<APPS_PWD> 0 Y DOWNLOAD $FND_TOP/patch/115/import/afffload.lct XXCUST_DFF_LOOKUP.ldt DESC_FLEX APPLICATION_SHORT_NAME="FND" DESCRIPTIVE_FLEXFIELD_NAME='FND_COMMON_LOOKUPS'

> FNDLOAD apps/<APPS_PWD> 0 Y DOWNLOAD $FND_TOP/patch/115/import/afffload.lct XXCUST_PA_EXPENDITURE_TYPES_DESC_FLEX_DFF.ldt DESC_FLEX APPLICATION_SHORT_NAME=PA DESCRIPTIVE_FLEXFIELD_NAME='PA_EXPENDITURE_TYPES_DESC_FLEX'

> FNDLOAD apps/<APPS_PWD> 0 Y DOWNLOAD $FND_TOP/patch/115/import/afffload.lct XXCUST_SELFSERVICE_REQUEST.ldt DESC_FLEX APPLICATION_SHORT_NAME="PER" DESCRIPTIVE_FLEXFIELD_NAME="Extra Person Info DDF" DESCRIPTIVE_FLEX_CONTEXT_CODE='XXCUST_SELFSERVICE_REQUEST'

###### Upload

> $FND_TOP/bin/FNDLOAD apps/<APPS_PWD> 0 Y UPLOAD $FND_TOP/patch/115/import/afffload.lct XXCUST_DFF.ldt

###### SQL Validate

> SELECT application_id, descriptive_flexfield_name, application_table_name
FROM fnd_descriptive_flexs_vl
WHERE application_table_name LIKE '%' || UPPER ('&tab_name') || '%'
ORDER BY application_table_name

<br>

## FNDLOAD Function


###### Download 

> FNDLOAD apps/<APPS_PWD> 0 Y DOWNLOAD $FND_TOP/patch/115/import/afsload.lct XXCUST_FUNCTION.ldt FUNCTION FUNCTION_NAME="XXCUST_FUNCTION"

###### Upload

> $FND_TOP/bin/FNDLOAD apps/<APPS_PWD> 0 Y UPLOAD $FND_TOP/patch/115/import/afsload.lct XXCUST_FUNCTION.ldt - WARNING=YES UPLOAD_MODE=REPLACE CUSTOM_MODE=FORCE

<br>

## FNDLOAD Forms Personalizations


###### Download 

> FNDLOAD apps/<APPS_PWD> 0 Y DOWNLOAD $FND_TOP/patch/115/import/affrmcus.lct XXCUST_PERSONALIZATIONS.ldt FND_FORM_CUSTOM_RULES function_name="XXCUST_PERSONALIZATIONS"

###### Upload

> FNDLOAD apps/$CLIENT_APPS_PWD 0 Y UPLOAD $FND_TOP/patch/115/import/affrmcus.lct XXCUST_PERSONALIZATIONS.ldt


<br>

## FNDLOAD Form


###### Download 

> $FND_TOP/bin/FNDLOAD apps/<APPS_PWD> 0 Y DOWNLOAD $FND_TOP/patch/115/import/afsload.lct XXCUST_FORM.ldt FORM FORM_NAME="XXCUST_FORM"

###### Upload

> $FND_TOP/bin/FNDLOAD apps/<APPS_PWD> 0 Y UPLOAD $FND_TOP/patch/115/import/afsload.lct XXCUST_FORM.ldt - WARNING=YES UPLOAD_MODE=REPLACE CUSTOM_MODE=FORCE


<br>

## FNDLOAD Menus

###### Download 

> $FND_TOP/bin/FNDLOAD apps/<APPS_PWD> O Y DOWNLOAD $FND_TOP/patch/115/import/afsload.lct XXCUST_MENU.ldt MENU MENU_NAME="XXCUST_MENU_NAME"

###### Upload

> $FND_TOP/bin/FNDLOAD apps/<APPS_PWD> O Y UPLOAD $FND_TOP/patch/115/import/afsload.lct XXCUST_MENU.ldt

###### SQL Validate

> SELECT user_menu_name
FROM fnd_menus_vl
WHERE menu_name = 'XXCUST_MENU_NAME'

<br>

## FNDLOAD Messages


Single Message

###### Download 

> FNDLOAD apps/<APPS_PWD> 0 Y DOWNLOAD $FND_TOP/patch/115/import/afmdmsg.lct XXCUST_MSG.ldt FND_NEW_MESSAGES APPLICATION_SHORT_NAME="XXCUST" MESSAGE_NAME="XXCUST_MSG_NAME"

All Messages On Application

###### Download 

> FNDLOAD apps/<APPS_PWD> 0 Y DOWNLOAD $FND_TOP/patch/115/import/afmdmsg.lct \XXCUST_MSG.ldt FND_NEW_MESSAGES APPLICATION_SHORT_NAME='XXCUST'

###### Upload

> FNDLOAD apps/<APPS_PWD> 0 Y UPLOAD $FND_TOP/patch/115/import/afmdmsg.lct XXCUST_MSG.ldt

> FNDLOAD apps/<APPS_PWD> O Y UPLOAD $FND_TOP/patch/115/import/afmdmsg.lct XXCUST_MSG.ldt UPLOAD_MODE=REPLACE CUSTOM_MODE=FORCE

<br>

###### SQL Validate

> SELECT application_id,
profile_option_name
|| '==>'
|| profile_option_id
|| '==>'
|| user_profile_option_name
FROM fnd_profile_options_vl
WHERE profile_option_name LIKE '%' || UPPER ('XXCUST_PROFILE_OPTION') || '%'
ORDER BY profile_option_name

<br>



<br>

## FNDLOAD Request Set and Link


###### Download 

Request Set
> FNDLOAD apps/<APPS_PWD> 0 Y DOWNLOAD $FND_TOP/patch/115/import/afcprset.lct XXCUST_REQUEST_SET_NAME.ldt REQ_SET REQUEST_SET_NAME='XXCUSTOM_REQUEST_SET_NAME'

Request Set Links
> FNDLOAD apps/<APPS_PWD> 0 Y DOWNLOAD $FND_TOP/patch/115/import/afcprset.lct XXCUST_REQUEST_SET_LINK.ldt REQ_SET_LINKS REQUEST_SET_NAME="XXCUSTOM_REQUEST_SET_NAME"


Request Set

> FNDLOAD apps/<APPS_PWD> 0 Y UPLOAD $FND_TOP/patch/115/import/afcprset.lct XXCUST_REQUEST_SET_NAME.ldt
Or
> FNDLOAD apps/<APPS_PWD> O Y UPLOAD $FND_TOP/patch/115/import/afcprset.lct XXCUST_REQUEST_SET_NAME.ldt UPLOAD_MODE=REPLACE CUSTOM_MODE=FORCE

Request Set Links
> FNDLOAD apps/<APPS_PWD> 0 Y UPLOAD $FND_TOP/patch/115/import/afcprset.lct XXCUST_REQUEST_SET_NAME.ldt

###### SQL Validate

> SELECT request_set_name
FROM fnd_request_sets_vl
WHERE user_request_set_name = 'XXCUSTOM_REQUEST_SET_NAME'

<br>

## FNDLOAD Value Set


###### Download 

> FNDLOAD apps/<APPS_PWD> O Y DOWNLOAD $FND_TOP/patch/115/import/afscursp.lct XXCUST_RESPONSIBILITY.ldt FND_RESPONSIBILITY RESP_KEY="XXCUST_RESPONSIBILITY_KEY"

###### Upload

> FNDLOAD apps/<APPS_PWD> O Y UPLOAD $FND_TOP/patch/115/import/afscursp.lct XXCUST_RESPONSIBILITY.ldt

<br>

### FNDLOAD RTF Template


###### Download 

> java oracle.apps.xdo.oa.util.XDOLoader DOWNLOAD -DB_USERNAME apps -DB_PASSWORD apps -JDBC_CONNECTION '(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=XX_HOST_NAME)(PORT=XX_PORT_NUMBER))(CONNECT_DATA=(SERVICE_NAME=XX_SERVICE_NAME)))' -LOB_TYPE TEMPLATE -LOB_CODE XX_TEMPLATE -APPS_SHORT_NAME XXCUST -LANGUAGE en -TERRITORY US -lct_FILE $XDO_TOP/patch/115/import/xdotmpl.lct -LOG_FILE $LOG_FILE_NAME

###### Upload

> java oracle.apps.xdo.oa.util.XDOLoader UPLOAD -DB_USERNAME apps -DB_PASSWORD apps -JDBC_CONNECTION '(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=XX_HOST_NAME)(PORT=XX_PORT_NUMBER))(CONNECT_DATA=(SERVICE_NAME=SERVICE_NAME)))' -LOB_TYPE TEMPLATE -LOB_CODE XX_TEMPLATE -XDO_FILE_TYPE RTF -FILE_NAME $RTF_FILE_PATH/$RTF_FILE_NAME.rtf -APPS_SHORT_NAME XXCUST -NLS_LANG en -TERRITORY US -LOG_FILE $LOG_FILE_NAME

<br>

## FNDLOAD Users


###### Download 

> FNDLOAD apps/<APPS_PWD> 0 Y DOWNLOAD $FND_TOP/patch/115/import/afscursp.lct /XXCUST_USER.ldt FND_USER USER_NAME='AHMEDELDEMASY'

###### Upload

> FNDLOAD apps/$CLIENT_APPS_PWD 0 Y UPLOAD $FND_TOP/patch/115/import/afscursp.lct /XXCUST_USER.ldt

<br>

## FNDLOAD Value Set


###### Download

> $FND_TOP/bin/FNDLOAD apps/<APPS_PWD> 0 Y DOWNLOAD $FND_TOP/patch/115/import/afffload.lct XXCUST_VALUE_SET.ldt VALUE_SET FLEX_VALUE_SET_NAME="XXCUST_VALUE_SET"

###### Upload

> $FND_TOP/bin/FNDLOAD apps/<APPS_PWD> 0 Y UPLOAD $FND_TOP/patch/115/import/afffload.lct XXCUST_VALUE_SET.ldt - WARNING=YES UPLOAD_MODE=REPLACE CUSTOM_MODE=FORCE


<br>

## FNDLOAD Workflow


###### Download
```
WFLOAD apps/<$APPS_PWD> 0 Y DOWNLOAD wf_XXDLWF.wft XXDLWF
```


###### Upload

```
WFLOAD apps/<$APPS_PWD>  0 Y UPLOAD wf_XXDLWF.wft
```
