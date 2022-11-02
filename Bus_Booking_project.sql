create database BusBooking;
use BusBooking;

create table bus_details 
(
bus_id varchar(15) PRIMARY KEY,
bus_no varchar(15) NOT NULL,
user_id int not null,
type_of_bus enum ('AC','SLEEPER','SEATER','NON-AC') default ('NON-AC'),
type_of_servies enum ('REGULAR','WEEKEND','ALTERNATE-DAYS','EVENT') default ('ALTERNATE-DAYS'),
no_of_seat INT NOT NULL
);

create table driver_detail(
driver_id varchar (15) PRIMARY KEY,
driver_name varchar(20) NOT NULL,
driver_lic_no varchar(20) NOT NULL,
contact_no varchar(15)NOT NULL);


create table user_detail(
user_id varchar(20) PRIMARY KEY,
full_name varchar(30) not null,
contact_no varchar(15) not null,
email varchar(20) not null,
username varchar(20) not null,
psswd varchar(20) not null);

create table user_wallet(
wallet_id varchar(10) primary key,
Wallet_Type enum ('PHONE-PAY','GOOGLE-PAY','PAYTM','CASH') default ('CASH'),
WalletAmount float,
user_id varchar (20),
FOREIGN KEY(user_id) REFERENCES user_detail(user_id)
);

create table travel_schedule(
schedule_id varchar(15) primary key,
bus_id varchar (15) not null,
driver_id varchar(15) not null,
starting_point varchar(20) not null,
destination_point varchar(20) not null,
schedule_date date,
departure_time time,
estimate_arrival_date date,
estimate_arrival_time time,
fare_amount float not null,
remark varchar(100),
FOREIGN KEY(bus_id) REFERENCES bus_details(bus_id),
FOREIGN KEY(driver_id) REFERENCES driver_detail(driver_id)
);

create table booking(
booking_id varchar(10) primary key,
schedule_id varchar(10) not null,
user_id varchar(10) not null,
seat_no int not null,
fare_amount float not null,
total_amount float not null,
dateofbooking TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
booking_status enum('PENDING','APPROVED','CANCELLED') default('PENDING'),
FOREIGN KEY(schedule_id) REFERENCES travel_schedule(schedule_id),
FOREIGN KEY(user_id) REFERENCES user_detail(user_id)
);


 
 create table payment_detail(
 payment_id varchar(15) primary key,
 user_id varchar(15) not null, 
 wallet_id varchar(15) NOT NULL,
 booking_id varchar (15) NOT NULL,
 amount float NOT NULL,
 paymate_date date ,
 payment_status enum ('PENDING','SUCCESSFULL','FILED') default('PENDING'),
 FOREIGN KEY( user_id) REFERENCES user_detail( user_id),
 FOREIGN KEY(wallet_id) REFERENCES user_wallet(wallet_id),
 FOREIGN KEY(booking_id) REFERENCES booking(booking_id));
 
 create table refund(
 refunt_id int auto_increment primary key,
  payment_id varchar(15),
  user_id varchar(15),
  wallet_id varchar(15),
  amount float not null,
  refund_date date ,
  refund_status enum  ('PENDING','SUCCESSFULL','FILED') default('PENDING'),
  FOREIGN KEY( user_id) REFERENCES user_detail( user_id),
   FOREIGN KEY(wallet_id) REFERENCES user_wallet(wallet_id),
    FOREIGN KEY(payment_id) REFERENCES payment_detail(payment_id));






