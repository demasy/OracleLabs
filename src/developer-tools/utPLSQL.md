# utPLSQL Installation

<br>

## Download
https://github.com/utPLSQL/utPLSQL-cli/releases

<br>

## Installation Commands

```
cd /<$INSTALLATION-PATH>/utPLSQL/source
```

```
sqlplus sys/manager as sysdba @install_headless_with_trigger.sql utp3 <$PASSWORD> <$TABLE_SPACE>  
```

## Checking environment and utPLSQL version

```
select substr(ut.version(),1,60) as ut_version from dual;
```

```
select 
  xmlserialize( content xmltype(ut_run_info()) as clob indent size = 2 )
  from dual;

```
