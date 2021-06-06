CREATE TABLE USUARIOS(
id_us NUMBER PRIMARY KEY,
clave VARCHAR2(100) NOT NULL,
nombre VARCHAR2(40) NOT NULL,
correo VARCHAR2(100) NOT NULL,
pais VARCHAR2(20) NOT NULL,
latitud VARCHAR2(50) NOT NULL,
longitud VARCHAR2(50) NOT NULL,
telefono VARCHAR2(30) NOT NULL,
Fecha_nac VARCHAR2(30) NOT NULL,
rtn VARCHAR2(40) NULL,
rol NUMBER DEFAULT(1),
likes NUMBER DEFAULT(0),
dislikes NUMBER DEFAULT(0),
CONSTRAINT correo_unico UNIQUE (correo)
);
SELECT latitud,longitud,correo,nombre FROM USUARIOS;

CREATE SEQUENCE secUsu
START WITH 1
INCREMENT BY 1;

CREATE TABLE MEMBRESIAS(
id_memb NUMBER PRIMARY KEY,
titular NUMBER,
fechaContrato VARCHAR2(40) NOT NULL,
tipo NUMBER NOT NULL,
CONSTRAINT mem_usu_fk FOREIGN KEY (titular) REFERENCES USUARIOS(id_us)
);

CREATE SEQUENCE secMem
START WITH 1
INCREMENT BY 1;

CREATE or REPLACE PROCEDURE insertaUsuario(cla VARCHAR2,nom VARCHAR2,ape VARCHAR2,ema VARCHAR2,pai VARCHAR2,lat VARCHAR2,lon VARCHAR2,tel VARCHAR2,fec VARCHAR2,rt varchar,rl number,tip number)
is
idUs number;
BEGIN
idUs:= secUsu.nextval;
INSERT INTO USUARIOS(id_us,clave,nombre,apellido,correo,pais,latitud,longitud,telefono,Fecha_nac,rtn,rol)
VALUES(idUs,cla,nom,ape,ema,pai,lat,lon,tel,fec,rt,rl);
INSERT INTO MEMBRESIAS(id_memb,titular,fechaContrato,tipo)
VALUES(secMem.nextval,idUs,SYSDATE,tip);
END insertaUsuario;

CREATE TABLE VEHICULOS(
id_veh NUMBER PRIMARY KEY,
id_cli NUMBER,
vin VARCHAR2 (50) NOT NULL,
marca VARCHAR2 (50) NOT NULL,
modelo VARCHAR2 (50) NOT NULL,
ubicacion VARCHAR2(300) NOT NULL,
cilindraje VARCHAR2(50) NOT NULL,
transmision VARCHAR2(50) NOT NULL,
kilometraje VARCHAR2(50) NOT NULL,
descripcion VARCHAR2(500) NOT NULL,
img1 VARCHAR2(300)NOT NULL,
img2 VARCHAR2(300) NOT NULL,
img3 VARCHAR2(300) NOT NULL,
disp_vent NUMBER DEFAULT(0),
disp_rent NUMBER DEFAULT(0),
val_venta NUMBER(10,2) DEFAULT(0),
val_renta NUMBER(10,2) DEFAULT(0),
CONSTRAINT vin_unico UNIQUE (vin),
CONSTRAINT veh_cli FOREIGN KEY (id_cli) REFERENCES USUARIOS(id_us)
);

CREATE SEQUENCE secveh
START WITH 1
INCREMENT BY 1;

SELECT vendedor_id,COUNT(*) AS conteo FROM FACTURAS GROUP BY vendedor_id;

SELECT * FROM (SELECT usuarios.correo,COUNT(*) AS conteo FROM FACTURAS 
INNER JOIN usuarios on facturas.vendedor_id=usuarios.id_us GROUP BY usuarios.correo order by conteo desc) vendedores WHERE ROWNUM<=10;

SELECT * FROM FACTURAS;
SELECT * FROM USUARIOS;
SELECT * FROM MEMBRESIAS;
SELECT * FROM VEHICULOS;
update vehiculos set disp_vent=1 where id_veh =44;
update usuarios set clave='pWo0LcexAjLBPI93W8ls2A==' where id_us =85;
update usuarios set clave='pWo0LcexAjLBPI93W8ls2A==' where id_us =83;
DELETE from MEMBRESIAS WHERE id_memb=33;

SELECT tipo, COUNT(*)as conteo from MEMBRESIAS GROUP BY tipo  ;



CREATE TABLE FACTURAS(
id_fact NUMBER PRIMARY KEY,
comprador_id NUMBER,
vendedor_id NUMBER,
fecha DATE DEFAULT to_char(sysdate,'dd/MM/yy'),
vehiculo_id NUMBER,
detalle VARCHAR(300) null,
multa NUMBER DEFAULT 0,
descuento NUMBER DEFAULT 0,
sub_total NUMBER(8,2),
CONSTRAINT fact_comp_fk FOREIGN KEY(comprador_id) REFERENCES USUARIOS(id_us),
CONSTRAINT fact_vend_fk FOREIGN KEY(vendedor_id) REFERENCES USUARIOS(id_us),
CONSTRAINT fact_veh_fk FOREIGN KEY(vehiculo_id) REFERENCES VEHICULOS(id_veh)
);

CREATE SEQUENCE secfact
START WITH 1
INCREMENT BY 1;

CREATE TABLE EMPRESA(
id_empresa NUMBER PRIMARY KEY,
nombre VARCHAR2(300) NOT NULL,
vision VARCHAR2(1000) NOT NULL,
mision VARCHAR2(1000) NOT NULL,
direccion VARCHAR2(300)NOT NULL,
longitud VARCHAR2(40) NULL,
latitud VARCHAR2(40) NULL
);

select * from empresa;
INSERT INTO EMPRESA (id_empresa,nombre,vision,mision,direccion)
VALUES(1,'CEUCAR.COM','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries','SPS ave34 calle 24(Honduras)');

CREATE or REPLACE PROCEDURE insertaFactura(compradorid NUMBER,vehiculoid NUMBER,detal VARCHAR2,subtotal NUMBER) 
is vendedor NUMBER;
BEGIN
SELECT id_cli into vendedor FROM VEHICULOS WHERE id_veh=vehiculoid;
INSERT INTO FACTURAS(id_fact,comprador_id,vendedor_id,vehiculo_id,detalle,sub_total)
VALUES(secfact.nextval,compradorid,vendedor,vehiculoid,detal,subtotal);
UPDATE VEHICULOS SET disp_vent=0 WHERE id_veh=vehiculoid;
END insertaFactura;

exec insertaFactura(83,44,'venta de vehiculo totyota corolla',160000);

Alter table USUARIOS modify pais varchar2(20);
exec insertaUsuario('Password','Santiago','Bernabeu','santiago@pemex.com','HN','14.1008588','-87.2430332','97231583','07/09/1993','0801199318279',2,2);
show error function insertaUsuario;
select sysdate from dual;
SELECT id_cli FROM VEHICULOS WHERE id_veh=44;
SELECT * FROM VEHICULOS WHERE disp_vent=1;
SELECT * FROM VEHICULOS;
SELECT * FROM MEMBRESIAS;
SELECT * FROM USUARIOS;
SELECT * FROM FACTURAS;
select to_char(sysdate,'dd/MM/yy') from dual;
select sysdate from dual;
delete from usuarios where id_us=49;
delete from MEMBRESIAS where titular=49;





select fechacontrato , tipo from membresias where titular =37;
update vehiculos set disp_vent=1 where id_veh=44;

UPDATE VEHICULOS SET  modelo='Elantra', ubicacion='HTG avenida 24 lote 45 HN', cilindraje='1800', transmision='Triptonica', kilometraje='456777', descripcion='Belleza', val_venta='150000'  WHERE id_veh=43;
commit;
 modelo='Elantra', ubicacion='HTG avenida 24 lote 45 HN', cilindraje='1800', transmision='Triptonica', kilometraje='456777', descripcion='Belleza', val_venta='150000' 
delete  FROM VEHICULOS WHERE id_cli=49;
UPDATE VEHICULOS SET modelo='Elantra' ,vin='pipi',marca='Hyundai',modelo,ubicacion,cilindraje,transmision,kilometraje,descripcion,img1,img2,img3,disp_vent,disp_rent,val_venta,val_renta WHERE id_veh=39;
UPDATE vehiculos SET img1='/CEUCAR/imagens/imag3.jpg',img2='/CEUCAR/imagens/imag3.jpg',img3='/CEUCAR/imagens/imag3.jpg'
vin,marca,modelo,ubicacion,cilindraje,transmision,
kilometraje,descripcion,img1,img2,img3,disp_vent,disp_rent,val_venta,val_renta

delete from USUARIOS WHERE id_us='25';
delete from USUARIOS WHERE id_us='27';
delete from USUARIOS WHERE id_us='30';
delete from USUARIOS WHERE id_us='24';

CREATE TABLE MARCAS (
id_mar NUMBER PRIMARY KEY,
descripcion VARCHAR2(20) NOT NULL
);

CREATE TABLE MODELOS (
id_mod NUMBER PRIMARY KEY,
id_marc NUMBER,
descripcion VARCHAR2(20) NOT NULL,
CONSTRAINT mar_mod_fk FOREIGN KEY (id_marc) REFERENCES MARCAS(id_mar)
);

CREATE TABLE TIPOS (
id_tip NUMBER PRIMARY KEY,
descripcion VARCHAR2(20) NOT NULL
);

INSERT INTO VEHICULOS(
id_veh,id_cli,vin,marca,modelo,ubicacion,cilindraje,transmision,
kilometraje,descripcion,img1,img2,img3,disp_vent,disp_rent,val_venta,val_renta )
VALUES(secveh.nextval,49,'JKL89098HH','Hyundai','Elantra','SPS 2445 Ave 23 HN','1800','AUTOMATICA','235000',
'full con todos los juguetes','https://ibb.co/nm40wxJ','https://ibb.co/tZtwczj','https://ibb.co/pxf4BjL',1,0,15000,0);

SELECT * FROM VEHICULOS WHERE id_veh=39;
SELECT * FROM VEHICULOS;
SELECT * FROM VEHICULOS WHERE rownum=3;

UPDATE VEHICULOS SET img1='<img src="https://cs.copart.com/v1/AUTH_svc.pdoc00001/PIX133/582409e1-8e39-4a8d-bb98-d5365ab8bdb0.JPG" class="img-thumbnail">' WHERE id_veh=21;
UPDATE VEHICULOS SET img1='<img src="https://cs.copart.com/v1/AUTH_svc.pdoc00001/PIX133/582409e1-8e39-4a8d-bb98-d5365ab8bdb0.JPG" class="img-thumbnail">' WHERE id_veh=8;
UPDATE VEHICULOS SET img1='<img src="https://www.autobild.es/sites/autobild.es/public/dc/fotos/Toyota-Corolla_Hatchback-2019_C01.jpg" class="img-thumbnail">' WHERE id_veh=9;

CREATE TABLE SUBASTAS (
id_sub NUMBER PRIMARY KEY,
titulo VARCHAR2(50),
inicio DATE,
final DATE
);

CREATE TABLE SUB_ITEMS(
item_id NUMBER PRIMARY KEY,
subasta NUMBER,
vehiculo NUMBER,
valor_ini NUMBER NOT NULL,
valor_fin NUMBER NOT NULL,
CONSTRAINT item_sub_fk FOREIGN KEY (subasta) REFERENCES SUBASTAS(id_sub),
CONSTRAINT itemsub_veh_fk FOREIGN KEY (vehiculo) REFERENCES VEHICULOS(id_veh)
);



CREATE TABLE PROGRAMACIONES(
id_cita NUMBER PRIMARY KEY,
client_id NUMBER,
proveedor NUMBER,
fecha DATE NOT NULL,
detalle VARCHAR2(200) NOT NULL,
total NUMBER(8,2),
factura NUMBER,
CONSTRAINT prog_cli_fk FOREIGN KEY(client_id) REFERENCES USUARIOS(id_us),
CONSTRAINT prog_prov_fk FOREIGN KEY(proveedor) REFERENCES USUARIOS(id_us),
CONSTRAINT prog_fact_fk FOREIGN KEY(factura) REFERENCES FACTURAS(id_fact)
);

CREATE TABLE RENTADOS(
id_rent NUMBER PRIMARY KEY,
proveedor_id NUMBER,
arrendatario NUMBER,
vehiculo_id NUMBER,
factura_id NUMBER,
desde DATE NOT NULL,
hasta DATE NOT NULL,
modalidad VARCHAR2(10) NOT NULL,
observaciones  VARCHAR2(200) NOT NULL,
valor NUMBER(8,2),
CONSTRAINT ren_prov_fk FOREIGN KEY(proveedor_id) REFERENCES USUARIOS(id_us),
CONSTRAINT ren_cli_fk FOREIGN KEY(arrendatario) REFERENCES USUARIOS(id_us),
CONSTRAINT ren_veh_fk FOREIGN KEY (vehiculo_id) REFERENCES VEHICULOS(id_veh),
CONSTRAINT ren_fact_fk FOREIGN KEY(factura_id) REFERENCES FACTURAS(id_fact)
);



