use mechanical_workshop;

insert into person(id_Person, type_person, CPF_CNPJ )
values(001, 'Fisica', '35733444510'),
      (002, 'Fisica','25063133812'),
      (003, 'Fisica','256632132512'),
      (004, 'Fisica', '35833429812');
      
insert into customer_registration( id_person_customer_registration, first_name, last_name, CPF_CNPJ, address, Cel,
 contact_phone)
 values( 001, 'Juliana', 'França','35733444510', 'Rua Jurubatuba-numero 27-Aparecida-Santos',
 '13-98888-1725','13-3222-2444'),
       ( 002, 'Rodrigo', 'Venceslau', '25063133812', 'Rua Jurubatuba-numero 36-Aparecida- Santos', 
       '13-98888-7400', '13-3225-5222'),
       ( 003, 'Rosa Maria', 'Soares' , '256632132512', 'Rua Alexandre Martins-numero 16-Aparecida- Santos',
       '13-9999-1101', '13-3322-2425'),
       ( 004, 'Mario Francisco', 'França', '35833429812', 'Rua Alexandre Martins-numero 86-Aparecida-Santos',
       '13-99901-0001', '13-3366-602');
       
insert into vehicle( vehicle_type, vehicle_model, vehicle_license_plate_number,vehicle_color )
   values( 'Carro', 'Kicks Active', 'JFG-8974', 'Prata'),
         ( 'Carro', 'Tiggo 5x Pro Hybrid Max Drive', 'PLO-9874', 'Preto'),
         ('Moto', 'Honda NC 750X', 'RTY-4415', 'Vermelha'),
         ( 'Caminhão', 'Volkswagen Delivery Express', 'KHG-1452', 'Branco');
         
           
insert into requested_quote(defect_checked, defect_description, quoted_product_description, budget_value)
       values( True, 'Problemas no câmbio', 'Troca de óleo', 120.00 ),
             ( True, 'Bateria ruim', 'Troca de bateria', 400.00),
			 ( True, 'Faróis', 'troca das lampadas dos faróis', 75.00),
             ( True, 'pastilhas gastas', 'Troca de pastilha', 250.00);
             
insert into payment (id_customer_registration_payment ,budgeted_amount, payment_type, agency_and_bank_account_password, pix_key)
        values(01, 120.00, 'Pix', 'agencia 004- conta 01235- senha 9874', '35733444510'),
             (02, 400.00, 'Pix', 'agencia 445- conta 45578- senha 2354', 'rodrigovenceslau@hotmail.com' ),
			 (03, 75.00, 'dinheiro', 'null','null'),
             ( 04, 250.00, 'Pix', 'agencia 045- conta 02785- senha 8512', '99901-0001');
             

             
INSERT INTO manufacturer (corporate_name, CNPJ_manufacturer, fantasy_name, location_manufacturer, contact_phone) 
VALUES
    ('Nissan.com', '202210006987415', 'Nissan', 'São Paulo', '11-3222-8864'),
    ('CAOACHERY.com', '112210006987718', 'Caoa', 'São Paulo', '11-3366-4574'),
    ('HR-V', '552210006987710', 'Honda', 'São Paulo', '11-4667-0020'),
    ('Volkswagen', '882210001087713', 'Volks', 'São Paulo', '11-3388-7700');

             
INSERT INTO shipping_company (name_shipping_company, CNPJ_shipping_company, location_shipping_company, contact_phone, id_manufacturer_shipping_company)
VALUES
    ('Tranporte Singer', '001202210006987001', 'São Paulo', '11-3333-5510', 1),
    ('Garagir Origin', '000202210000999000', 'São Paulo', '11-3988-5010', 2),
    ('Transporte Quality Origin', '000202210000991000', 'São Paulo', '11-3468-70001', 3);



       
insert into mechanical_workshop(id_mechanical_workshop, corporate_name_mechanical_workshop, fantasy_name_mechanical_workshop, CNPJ_mechanical_workshop,
 location_mechanical_workshop, phone_mechanical_workshop )
      values (25, 'MFG.LTDA', 'Mecanica do Mauricio','000582210001087715', 'cidade Santos- SP', '13-3355-4402'),
             (26, 'KNWA.LTDA', 'Mecanica José Carlos', '01005822100010871002', 'cidade Praia Grande-SP', '13-3399-5500'),
			 (27, 'Estrelas.LTDA','Mecanica Estrela Guia', '200582200011087716', 'cidade São Vicente-SP', '13-3245-0001'),
             (28, 'Car.LTDA', 'Mecanica Menezes', '020282200012088810', 'cidade Guarujá-SP', '13-3468-1100');