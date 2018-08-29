create table customer(
  2  c_id number(10),
  3  c_name varchar(20),
  4  c_email varchar(20),
  5  c_pass varchar(20),
  6  c_phone number(10),
  7  c_address varchar(20));

Table created.

SQL> alter table customer add constraint c_prime primary key(c_id);

Table altered.

SQL> create sequence c_seq start with 1001;

Sequence created.

SQL> create or replace trigger c_trig
  2  before insert on customer for each row
  3  begin
  4  select c_seq.nextval into :new.c_id from dual;
  5  end;
  6  /

Trigger created.
SQL> 
SQL> 
SQL> create table product(
  2  p_id number(10),
  3  p_name varchar(20),
  4  p_price number(10,2),
  5  p_stock number(10),
  6  p_type varchar(20),
  7  p_brand varchar(20),
  8  p_size varchar(10),
  9  p_imagename varchar(20),
 10  p_image blob);

Table created.

SQL> alter table product add constraint p_prime primary key(p_id);

Table altered.

SQL> create sequence p_seq start with 5001;

Sequence created.

SQL> create or replace trigger p_trig
  2  before insert on product
  3  for each row
  4  begin
  5  select p_seq.nextval into :new.p_id from dual;
  6  end;
  7  /

Trigger created.

SQL> create table orders(
  2  o_id number(10),
  3  cid number(10),
  4  cartid number(10));

Table created.

SQL> alter table orders add constraint o_prime primary key(o_id);

Table altered.

SQL> create sequence o_seq start with 9001;

Sequence created.

SQL> create or replace trigger o_trig
  2  before insert on orders
  3  for each row
  4  begin
  5  select o_seq.nextval into :new.o_id from dual;
  6  end;
  7  /

Trigger created.

SQL> create table cart(
  2  cart_id number(10),
  3  cart_total number(10,2),
  4  pid1 number(10),
  5  pid2 number(10),
  6  pid3 number(10),
  7  pid4 number(10),
  8  pid5 number(10));

Table created.

SQL> alter table cart add constraint cart_prime primary key(cart_id);

Table altered.

SQL> create sequence cart_seq start with 7001;

Sequence created.

SQL> create or replace trigger cart_trig
  2  before insert on cart
  3  for each row
  4  begin
  5  select cart_seq.nextval into :new.cart_id from dual;
  6  end;
  7  /

Trigger created.

SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
CART                           TABLE                                            
CUSTOMER                       TABLE                                            
ORDERS                         TABLE                                            
PRODUCT                        TABLE                                            

SQL> create table junction(
  2  cid number(10),
  3  pid number(10));

Table created.

SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
CART                           TABLE                                            
CUSTOMER                       TABLE                                            
JUNCTION                       TABLE                                            
ORDERS                         TABLE                                            
PRODUCT                        TABLE                                            

SQL> 
SQL> 
SQL> 
SQL> alter table junction
  2  add constraint c_foreign foreign key(cid)
  3  references customer(c_id);

Table altered.

SQL> alter table junction
  2  add constraint p_foreign foreign key(pid)
  3  references product(p_id);

Table altered.

SQL> alter table orders
  2  add constraint c_oforeign foreign key(cid)
  3  references customer(c_id);

Table altered.

SQL> alter table orders
  2  add constraint cart_foreign foreign key(cartid)
  3  references cart(cart_id);

Table altered.

SQL> alter table cart
  2  add constraint pid1_foreign foreign key(pid1)
  3  references product(p_id);

Table altered.

SQL> alter table cart
  2  add constraint pid2_foreign foreign key(pid2)
  3  references product(p_id);

Table altered.

SQL> alter table cart
  2  add constraint pid3_foreign foreign key(pid3)
  3  references product(p_id);

Table altered.

SQL> alter table cart
  2  add constraint pid4_foreign foreign key(pid4)
  3  references product(p_id);

Table altered.

SQL> alter table cart
  2  add constraint pid5_foreign foreign key(pid5)
  3  references product(p_id);

Table altered.

SQL> select * from tab
  2  ;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
CART                           TABLE                                            
CUSTOMER                       TABLE                                            
JUNCTION                       TABLE                                            
ORDERS                         TABLE                                            
PRODUCT                        TABLE                                            

SQL> desc customer
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 C_ID                                      NOT NULL NUMBER(10)
 C_NAME                                             VARCHAR2(20)
 C_EMAIL                                            VARCHAR2(20)
 C_PASS                                             VARCHAR2(20)
 C_PHONE                                            NUMBER(10)
 C_ADDRESS                                          VARCHAR2(20)

SQL> desc product
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 P_ID                                      NOT NULL NUMBER(10)
 P_NAME                                             VARCHAR2(20)
 P_PRICE                                            NUMBER(10,2)
 P_STOCK                                            NUMBER(10)
 P_TYPE                                             VARCHAR2(20)
 P_BRAND                                            VARCHAR2(20)
 P_SIZE                                             VARCHAR2(10)
 P_IMAGENAME                                        VARCHAR2(20)
 P_IMAGE                                            BLOB

SQL> desc orders
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 O_ID                                      NOT NULL NUMBER(10)
 CID                                                NUMBER(10)
 CARTID                                             NUMBER(10)

SQL> desc junction
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CID                                                NUMBER(10)
 PID                                                NUMBER(10)

SQL> desc cart
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CART_ID                                   NOT NULL NUMBER(10)
 CART_TOTAL                                         NUMBER(10,2)
 PID1                                               NUMBER(10)
 PID2                                               NUMBER(10)
 PID3                                               NUMBER(10)
 PID4                                               NUMBER(10)
 PID5                                               NUMBER(10)

SQL> commit;

Commit complete.

SQL> spool off;
