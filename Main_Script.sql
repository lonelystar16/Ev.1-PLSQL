SET SERVEROUTPUT ON;

-- -- Declaración de variables BIND
-- -- Caso 1
-- VAR b_run NUMBER;
-- EXEC :b_run := 18560875;
-- VAR b_porc NUMBER;
-- EXEC :b_porc := 40;


-- -- Bloque anónimo
-- DECLARE
--     v_Nombre VARCHAR2(50);
--     v_run VARCHAR2(11);
--     V_Sueldo NUMBER(10);
-- BEGIN

--     -- Cursor implicito de la consulta
--     SELECT :b_run || '-' || dvrut_emp, nombre_emp || ' ' || appaterno_emp || ' ' || apmaterno_emp, sueldo_emp
--     INTO v_run, v_Nombre, V_Sueldo
--     FROM empleado
--     WHERE numrut_emp = :b_run
--     AND sueldo_emp < 500000
--     AND id_categoria_emp <> 3;
    
--     -- Impresión de los datos
--     DBMS_OUTPUT.PUT_LINE('DATOS CALCULO BONIFICACION EXTRA DEL ' || :b_porc || '% DEL SUELDO');
--     DBMS_OUTPUT.PUT_LINE('Nombre empleado   : ' || v_Nombre);
--     DBMS_OUTPUT.PUT_LINE('Run               : ' || v_run);
--     DBMS_OUTPUT.PUT_LINE('Sueldo            : ' || TO_CHAR (V_Sueldo, '$999G999G999'));
--     DBMS_OUTPUT.PUT_LINE('Bonificacion extra: ' || TO_CHAR(ROUND(V_Sueldo * :b_porc / 100), '$999G999G999'));
    
-- END;


-- Caso 2

-- VAR b_run NUMBER;
-- -- 3 RUNS: 12487147 / 12861354 / 13050258
-- EXEC :b_run := 13050258;
-- VAR b_valorRenta NUMBER;
-- EXEC :b_valorRenta := 800000;

-- DECLARE
--     v_nombre VARCHAR2(100);
--     v_run VARCHAR2(12);
--     v_estado_civil estado_civil.desc_estcivil%TYPE;
--     v_renta NUMBER;

-- BEGIN

--     SELECT :b_run || '-' || CL.dvrut_cli,
--             CL.NOMBRE_CLI ||' ' || CL.APPATERNO_CLI || ' ' || CL.APMATERNO_CLI,
--             CL.RENTA_CLI,
--             EC.DESC_ESTCIVIL
--     INTO v_run, v_nombre, v_renta, v_estado_civil
--     FROM CLIENTE CL JOIN ESTADO_CIVIL EC
--         ON CL.ID_ESTCIVIL = EC.ID_ESTCIVIL
--     WHERE (CL.numrut_cli = :b_run AND EC.DESC_ESTCIVIL = 'Soltero')
--     OR (cl.numrut_cli = :b_run and ec.desc_estcivil in ('Separado', 'Divorciado') AND cl.renta_cli >= :b_valorRenta);
--     DBMS_OUTPUT.PUT_LINE('Query Ejecutada Correctamente');
    
--     -- DBMS_OUTPUT.PUT_LINE() Para no tener que borrar el contenido
--     dbms_output.put_line('DATOS DEL CLIENTE');
--     dbms_output.put_line('-------------------------');
--     dbms_output.put_line('Nombre:   ' || v_nombre);
--     dbms_output.put_line('RUN:   ' || v_run);
--     dbms_output.put_line('Estado civil:   ' || v_estado_civil);
--     dbms_output.put_line('Renta       : ' || TRIM(TO_CHAR(v_renta, '$9G999G999')));


--     END;


-- CASO 3
-- Porcentaje de Aumento forma parametrica (Bind)

-- VAR b_porc NUMBER
-- EXEC :b_porc := 8.5;
-- VAR b_porc2 NUMBER
-- EXEC :b_porc2 := 20
-- VAR b_valorMinimoRenta NUMBER
-- EXEC :b_valorMinimoRenta := 200000
-- VAR b_valorMaximoRenta NUMBER
-- EXEC :b_valorMaximoRenta := 400000
-- VAR b_run VARCHAR2(11);
-- EXEC :b_run := 12260812;

-- DECLARE

--     v_nombre VARCHAR2(100);
--     v_run VARCHAR2(11);
--     v_sueldo empleado.sueldo_emp%TYPE;

-- BEGIN

--     SELECT :b_run || '-' || dvrut_emp,
--             NOMBRE_EMP ||' ' || APPATERNO_EMP || ' ' || APMATERNO_EMP,
--             SUELDO_EMP
--     INTO v_run, v_nombre, v_sueldo
--     FROM EMPLEADO
--     WHERE numrut_emp = :b_run;
--     -- Imprimir los datos capturados y los datos requeridos por el cliente
--     DBMS_OUTPUT.PUT_LINE('Nombre del Empleado:  ' || v_nombre);
--     DBMS_OUTPUT.PUT_LINE('RUN: ' || v_run);
--     DBMS_OUTPUT.PUT_LINE('Simulación 1: Aumentar en ' || :b_porc || '% el salario de todos los empleados');
--     DBMS_OUTPUT.PUT_LINE('Sueldo: ' || TRIM(TO_CHAR(v_sueldo,'$999g999g999')));
--     DBMS_OUTPUT.PUT_LINE('Sueldo reajustado: ' || TRIM(TO_CHAR((v_sueldo + ROUND(v_sueldo * :b_porc / 100)),'$999G999G999')));
--     DBMS_OUTPUT.PUT_LINE('Reajuste: ' || TRIM(TO_CHAR(ROUND(v_sueldo * :b_porc / 100),'$999G999G999')));
    
--     DBMS_OUTPUT.PUT_LINE('');
    
--     DBMS_OUTPUT.PUT_LINE('Simulacion 2: Aumentar en ' || :b_porc2 || '% el salario de los empleados que poseen entre ' 
--     || TRIM(TO_CHAR(:b_valorMinimoRenta,'$999G999G999')) || ' y ' || TRIM(TO_CHAR(:b_valorMaximoRenta,'$999G999G999')));
    
--     -- Se crea el cursor implicito para la query

--     SELECT :b_run || '-' || dvrut_emp,
--             NOMBRE_EMP ||' ' || APPATERNO_EMP || ' ' || APMATERNO_EMP,
--             SUELDO_EMP
--     INTO v_run, v_nombre, v_sueldo
--     FROM EMPLEADO
--     WHERE numrut_emp = :b_run
--     AND SUELDO_EMP BETWEEN :b_valorMinimoRenta and :b_valorMaximoRenta;
    
--     DBMS_OUTPUT.PUT_LINE('');
--     DBMS_OUTPUT.PUT_LINE('Sueldo: ' || TRIM(TO_CHAR(v_sueldo,'$999g999g999')));
--     DBMS_OUTPUT.PUT_LINE('Sueldo reajustado: ' || TRIM(TO_CHAR((v_sueldo + ROUND(v_sueldo * :b_porc / 100)),'$999G999G999')));
--     DBMS_OUTPUT.PUT_LINE('Reajuste: ' || TRIM(TO_CHAR(ROUND(v_sueldo * :b_porc2 / 100),'$999G999G999')));


-- END;

-- Caso 4
VAR b_propiedad1 CHAR(1);
EXEC :b_propiedad1 := 'A'

VAR b_propiedad2 CHAR(1);
EXEC :b_propiedad2 := 'B'

VAR b_propiedad3 CHAR(1);
EXEC :b_propiedad3 := 'C'

VAR b_propiedad4 CHAR(1);
EXEC :b_propiedad4 := 'D'

VAR b_propiedad5 CHAR(1);
EXEC :b_propiedad5 := 'E'

VAR b_propiedad6 CHAR(1);
EXEC :b_propiedad6 := 'F'

VAR b_propiedad7 CHAR(1);
EXEC :b_propiedad7 := 'G'

VAR b_propiedad8 CHAR(1);
EXEC :b_propiedad8 := 'H'


DECLARE

    v_tipoPropiedad TIPO_PROPIEDAD.DESC_TIPO_PROPIEDAD%TYPE;
    v_numPropiedad NUMBER;
    v_renta NUMBER;

BEGIN

    SELECT TP.DESC_TIPO_PROPIEDAD, COUNT(*), SUM(P.VALOR_ARRIENDO)
    INTO v_tipoPropiedad, v_numPropiedad, v_renta
    FROM TIPO_PROPIEDAD TP
    JOIN PROPIEDAD P
    ON TP.ID_TIPO_PROPIEDAD = P.ID_TIPO_PROPIEDAD
    WHERE TP.ID_TIPO_PROPIEDAD = :b_propiedad1
    GROUP BY TP.DESC_TIPO_PROPIEDAD;
    DBMS_OUTPUT.PUT_LINE('Resumen de: ' || v_tipoPropiedad);
    DBMS_OUTPUT.PUT_LINE('Total de Propiedades: ' || v_numPropiedad);
    DBMS_OUTPUT.PUT_LINE('Valor Total Arriendo: ' || TRIM(TO_CHAR(v_renta,'$999g999g999')));
    DBMS_OUTPUT.PUT_LINE('');
    -- Propiedad 2
    SELECT TP.DESC_TIPO_PROPIEDAD, COUNT(*), SUM(P.VALOR_ARRIENDO)
    INTO v_tipoPropiedad, v_numPropiedad, v_renta
    FROM TIPO_PROPIEDAD TP
    JOIN PROPIEDAD P
    ON TP.ID_TIPO_PROPIEDAD = P.ID_TIPO_PROPIEDAD
    WHERE TP.ID_TIPO_PROPIEDAD = :b_propiedad2
    GROUP BY TP.DESC_TIPO_PROPIEDAD;
    DBMS_OUTPUT.PUT_LINE('Resumen de: ' || v_tipoPropiedad);
    DBMS_OUTPUT.PUT_LINE('Total de Propiedades: ' || v_numPropiedad);
    DBMS_OUTPUT.PUT_LINE('Valor Total Arriendo: ' || TRIM(TO_CHAR(v_renta,'$999g999g999')));
    DBMS_OUTPUT.PUT_LINE('');

    -- Propiedad 3
    SELECT TP.DESC_TIPO_PROPIEDAD, COUNT(*), SUM(P.VALOR_ARRIENDO)
    INTO v_tipoPropiedad, v_numPropiedad, v_renta
    FROM TIPO_PROPIEDAD TP
    JOIN PROPIEDAD P
    ON TP.ID_TIPO_PROPIEDAD = P.ID_TIPO_PROPIEDAD
    WHERE TP.ID_TIPO_PROPIEDAD = :b_propiedad3
    GROUP BY TP.DESC_TIPO_PROPIEDAD;
    DBMS_OUTPUT.PUT_LINE('Resumen de: ' || v_tipoPropiedad);
    DBMS_OUTPUT.PUT_LINE('Total de Propiedades: ' || v_numPropiedad);
    DBMS_OUTPUT.PUT_LINE('Valor Total Arriendo: ' || TRIM(TO_CHAR(v_renta,'$999g999g999')));

    DBMS_OUTPUT.PUT_LINE('');

    SELECT TP.DESC_TIPO_PROPIEDAD, COUNT(*), SUM(P.VALOR_ARRIENDO)
    INTO v_tipoPropiedad, v_numPropiedad, v_renta
    FROM TIPO_PROPIEDAD TP
    JOIN PROPIEDAD P
    ON TP.ID_TIPO_PROPIEDAD = P.ID_TIPO_PROPIEDAD
    WHERE TP.ID_TIPO_PROPIEDAD = :b_propiedad4
    GROUP BY TP.DESC_TIPO_PROPIEDAD;
    DBMS_OUTPUT.PUT_LINE('Resumen de: ' || v_tipoPropiedad);
    DBMS_OUTPUT.PUT_LINE('Total de Propiedades: ' || v_numPropiedad);
    DBMS_OUTPUT.PUT_LINE('Valor Total Arriendo: ' || TRIM(TO_CHAR(v_renta,'$999g999g999')));

    DBMS_OUTPUT.PUT_LINE('');

    SELECT TP.DESC_TIPO_PROPIEDAD, COUNT(*), SUM(P.VALOR_ARRIENDO)
    INTO v_tipoPropiedad, v_numPropiedad, v_renta
    FROM TIPO_PROPIEDAD TP
    JOIN PROPIEDAD P
    ON TP.ID_TIPO_PROPIEDAD = P.ID_TIPO_PROPIEDAD
    WHERE TP.ID_TIPO_PROPIEDAD = :b_propiedad4
    GROUP BY TP.DESC_TIPO_PROPIEDAD;
    DBMS_OUTPUT.PUT_LINE('Resumen de: ' || v_tipoPropiedad);
    DBMS_OUTPUT.PUT_LINE('Total de Propiedades: ' || v_numPropiedad);
    DBMS_OUTPUT.PUT_LINE('Valor Total Arriendo: ' || TRIM(TO_CHAR(v_renta,'$999g999g999')));

    DBMS_OUTPUT.PUT_LINE('');

    SELECT TP.DESC_TIPO_PROPIEDAD, COUNT(*), SUM(P.VALOR_ARRIENDO)
    INTO v_tipoPropiedad, v_numPropiedad, v_renta
    FROM TIPO_PROPIEDAD TP
    JOIN PROPIEDAD P
    ON TP.ID_TIPO_PROPIEDAD = P.ID_TIPO_PROPIEDAD
    WHERE TP.ID_TIPO_PROPIEDAD = :b_propiedad5
    GROUP BY TP.DESC_TIPO_PROPIEDAD;
    DBMS_OUTPUT.PUT_LINE('Resumen de: ' || v_tipoPropiedad);
    DBMS_OUTPUT.PUT_LINE('Total de Propiedades: ' || v_numPropiedad);
    DBMS_OUTPUT.PUT_LINE('Valor Total Arriendo: ' || TRIM(TO_CHAR(v_renta,'$999g999g999')));

    DBMS_OUTPUT.PUT_LINE('');

    SELECT TP.DESC_TIPO_PROPIEDAD, COUNT(*), SUM(P.VALOR_ARRIENDO)
    INTO v_tipoPropiedad, v_numPropiedad, v_renta
    FROM TIPO_PROPIEDAD TP
    JOIN PROPIEDAD P
    ON TP.ID_TIPO_PROPIEDAD = P.ID_TIPO_PROPIEDAD
    WHERE TP.ID_TIPO_PROPIEDAD = :b_propiedad6
    GROUP BY TP.DESC_TIPO_PROPIEDAD;
    DBMS_OUTPUT.PUT_LINE('Resumen de: ' || v_tipoPropiedad);
    DBMS_OUTPUT.PUT_LINE('Total de Propiedades: ' || v_numPropiedad);
    DBMS_OUTPUT.PUT_LINE('Valor Total Arriendo: ' || TRIM(TO_CHAR(v_renta,'$999g999g999')));

    DBMS_OUTPUT.PUT_LINE('');

    SELECT TP.DESC_TIPO_PROPIEDAD, COUNT(*), SUM(P.VALOR_ARRIENDO)
    INTO v_tipoPropiedad, v_numPropiedad, v_renta
    FROM TIPO_PROPIEDAD TP
    JOIN PROPIEDAD P
    ON TP.ID_TIPO_PROPIEDAD = P.ID_TIPO_PROPIEDAD
    WHERE TP.ID_TIPO_PROPIEDAD = :b_propiedad7
    GROUP BY TP.DESC_TIPO_PROPIEDAD;
    DBMS_OUTPUT.PUT_LINE('Resumen de: ' || v_tipoPropiedad);
    DBMS_OUTPUT.PUT_LINE('Total de Propiedades: ' || v_numPropiedad);
    DBMS_OUTPUT.PUT_LINE('Valor Total Arriendo: ' || TRIM(TO_CHAR(v_renta,'$999g999g999')));
    
    DBMS_OUTPUT.PUT_LINE('');


    SELECT TP.DESC_TIPO_PROPIEDAD, COUNT(*), SUM(P.VALOR_ARRIENDO)
    INTO v_tipoPropiedad, v_numPropiedad, v_renta
    FROM TIPO_PROPIEDAD TP
    JOIN PROPIEDAD P
    ON TP.ID_TIPO_PROPIEDAD = P.ID_TIPO_PROPIEDAD
    WHERE TP.ID_TIPO_PROPIEDAD = :b_propiedad8
    GROUP BY TP.DESC_TIPO_PROPIEDAD;
    DBMS_OUTPUT.PUT_LINE('Resumen de: ' || v_tipoPropiedad);
    DBMS_OUTPUT.PUT_LINE('Total de Propiedades: ' || v_numPropiedad);
    DBMS_OUTPUT.PUT_LINE('Valor Total Arriendo: ' || TRIM(TO_CHAR(v_renta,'$999g999g999')));
END;


