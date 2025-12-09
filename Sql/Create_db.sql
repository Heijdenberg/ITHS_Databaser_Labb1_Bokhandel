create table [Förlag] (
	[Id] int identity(1,1),
	[Namn] varchar(60) not null,
	constraint [PK_Forlag] primary key ([Id])
);

create table [Böcker] (
	[ISBN] char(13)
	check ([ISBN] not like '%[^0-9]%'),
	[Titel] varchar(50) not null,
	[Språk] varchar(30) not null,
	[Pris] decimal(10,2) not null
		check ([Pris] > 0),
	[Utgivningsdatum] datetime2,
	[Förlag] int not null,
	constraint [PK_Bocker] primary key ([ISBN]),
	constraint [FK_Bocker_Forlag_Id]
		foreign key ([Förlag]) references [Förlag]([Id])
);

create table [Författare] (
	[Id] int identity(1,1),
	[Förnamn] varchar(50) not null,
	[Efternamn] varchar(100) not null,
	[Födelsedatum] datetime2,
	[Dödsdatum] datetime2 null,
	constraint [PK_Forfattare] primary key ([Id])
);

create table [Bokförfattare] (
	FörfattarId int not null,
	ISBN char(13)  not null,

	constraint [FK_Bokforfattare_Forfattare_id]
		foreign key ([FörfattarId]) references [Författare]([Id]), 
	constraint [FK_Bokförfattare_Bocker_ISBN]
		foreign key ([ISBN]) references [Böcker]([ISBN]),
	constraint [PK_Bokforfattare] primary key ([FörfattarId],[ISBN])
);

create table [Genrer](
	[Id] int identity(1,1),
	[Namn] varchar(50) not null unique,

	constraint [PK_Genrer] primary key ([Id])
);

create table [Bokgenre](
	[ISBN] char(13) not null,
	[GenreId] int not null,

	constraint [FK_Bokgenre_Bocker_ISBN]
		foreign key ([ISBN]) references [Böcker]([ISBN]),
	constraint [FK_Bokgenre_Genrer_Id]
		foreign key ([GenreId]) references [Genrer]([Id]),
	constraint [PK_Bokgenre]
		primary key ([ISBN], [GenreId])
);

create table [Butiker](
	[Id] int identity(1,1),
	[Namn] varchar(50) not null,
	[Adress] varchar(50) not null,

	constraint [PK_Butiker]
		primary key ([Id])
);

create table [LagerSaldo](
	[ISBN] char(13) not null,
	[ButiksId] int not null,
	[Antal] int not null
		check ([Antal] >= 0),

	constraint [FK_LagerSaldo_Bocker_ISBN]
		foreign key ([ISBN]) references [Böcker]([ISBN]),
	constraint [FK_LagerSaldo_Butiker_Id]
		foreign key ([ButiksId]) references [Butiker]([Id]),
	constraint [PK_LagerSaldo]
		primary key ([ISBN],[ButiksId])
);

create table [Kunder](
	[Id] int identity(1,1),
	[Förnamn] varchar(50) not null,
	[Efternamn] varchar(100) not null,
	[Epost] varchar(200) unique,

	constraint [PK_Kunder]
		primary key ([Id])
);

create table [Försäljningar](
	[Id] int identity(1,1),
	[KundId] int not null,
	[ButiksId] int not null,
	[OrderDatum] datetime2 not null
		constraint [DF_Forsaljningar_OrderDatum] default sysdatetime(),

	constraint [FK_Forsaljningar_Kunder_Id]
		foreign key ([KundId]) references [Kunder]([Id]),
	constraint [FK_Forsaljningar_Butiker_Id]
		foreign key ([ButiksId]) references [Butiker]([Id]),
	constraint [PK_Forsaljningar]
		primary key ([Id])
);

create table [FörsäljningsDetaljer](
	[ISBN] char(13) not null,
	[FörsäljningsId] int not null,
	[Antal] int not null
		check ([Antal] > 0),
	[Pris] decimal(10,2) not null
		check ([Pris] >= 0),

	constraint [FK_ForsaljningsDetaljer_Bocker_ISBN]
		foreign key ([ISBN]) references [Böcker]([ISBN]),
	constraint [FK_ForsaljningsDetaljer_Forsaljningar_Id]
		foreign key ([FörsäljningsId]) references [Försäljningar](Id),
	constraint [PK_ForsaljningsDetaljer]
		primary key ([ISBN], [FörsäljningsId])
);

----
create table
	[Leverantörer] ( [Id] int identity(1,1),
	[Namn] varchar(100) not null,
	[Telefon] varchar(50) null,
	[Epost] varchar(200) null,
constraint [PK_Leverantorer] primary key ([Id])
);

create table [BokLeverantör] (
    [LeverantörId] int not null,
    [ISBN] char(13) not null,
    [InköpsPris] decimal(10,2) null
        check ([InköpsPris] >= 0),
    constraint [FK_BokLeverantor_Leverantorer]
        foreign key ([LeverantörId]) references [Leverantörer]([Id]),
    constraint [FK_BokLeverantor_Bocker]
        foreign key ([ISBN]) references [Böcker]([ISBN]),
	constraint [PK_BokLeverantor] primary key ([LeverantörId], [ISBN])
);