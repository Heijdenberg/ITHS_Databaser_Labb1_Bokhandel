
-- begin tran;
-- rollback;
-- commit;
-- drop table [Förlag];
-- drop table [Böcker];

create table [Förlag] (
	[Id] int identity(1,1),
	[Namn] varchar(60),
	constraint [PK_Forlag] primary key ([Id])
);

create table [Böcker] (
	[ISBN] char(13)
	check ([ISBN] NOT LIKE '%[^0-9]%'),
	[Titel] varchar(50),
	[Språk] varchar(30),
	[Pris] decimal(10,2) NOT NULL,
	[Utgivningsdatum] datetime2,
	[Förlag] int not null,
	constraint [PK_Bocker] primary key ([ISBN]),
	constraint [FK_Bocker_Forlag_Id]
		foreign key ([Förlag]) references [Förlag]([Id])
);

create table [Författare] (
	[Id] int identity(1,1),
	[Förnamn] varchar(50),
	[Efternamn] varchar(100),
	[Födelsedatum] datetime2,
	constraint [PK_Forfattare] primary key ([Id])
);

create table [Bokförfattare] (
	Författareid int not null,
	ISBN char(13)  not null,

	constraint [FK_Bokforfattare_Forfattare_id]
		foreign key ([Författareid]) references [Författare]([Id]), 
	constraint [FK_Bokförfattare_Bocker_ISBN]
		foreign key ([ISBN]) references [Böcker]([ISBN]),
	constraint [PK_Bokforfattare] primary key ([Författareid],[ISBN])
);

create table [Genrer](
	[Id] int identity(1,1),
	[Namn] varchar(50),

	constraint [PK_Genrer] primary key ([Id])
)

create table [Bokgenre](
	[ISBN] char(13) not null,
	[GenreId] int not null,

	constraint [FK_Bokgenre_Bocker_ISBN]
		foreign key ([ISBN]) references [Böcker]([ISBN]),
	constraint [FK_Bokgenre_Genrer_Id]
		foreign key ([GenreId]) references [Genrer]([Id]),
	constraint [PK_Bokgenre]
		primary key ([ISBN], [GenreId])
)

create table [Butiker](
	[Id] int identity(1,1),
	[Namn] varchar(50),
	[Adress] varchar(50),

	constraint [PK_Butiker]
		primary key ([Id])
)

create table [LagerSaldo](
	[ISBN] char(13) not null,
	[ButiksId] int not null,
	[Antal] int not null,

	constraint [FK_LagerSaldo_Bocker_ISBN]
		foreign key ([ISBN]) references [Böcker]([ISBN]),
	constraint [FK_LagerSaldo_Butiker_Id]
		foreign key ([ButiksId]) references [Butiker]([Id]),
	constraint [PK_LagerSaldo]
		primary key ([ISBN],[ButiksId])
);

create table [Kunder](
	[Id] int identity(1,1),
	[Förnamn] varchar(50),
	[Efternamn] varchar(100),

	constraint [PK_Kunder]
		primary key ([Id])
)

create table [Försäljningar](
	[Id] int identity(1,1),
	[KundId] int not null,
	[ButiksId] int not null,
	[OrderDatum] datetime2 not null,

	constraint [FK_Forsaljningar_Kunder_Id]
		foreign key ([KundId]) references [Kunder]([Id]),
	constraint [FK_Forsaljningar_Butiker_Id]
		foreign key ([ButiksId]) references [Butiker]([Id]),
	constraint [PK_Forsaljningar]
		primary key ([Id])
)

create table [FörsäljningsDetalier](
	[ISBN] char(13) not null,
	[FörsäljningsId] int not null,
	[Antal] int,
	[Pris] decimal(10,2),

	constraint [FK_ForsaljningsDetalier_Bocker_ISBN]
		foreign key ([ISBN]) references [Böcker]([ISBN]),
	constraint [FK_ForsaljningsDetalier_Forsaljningar_Id]
		foreign key ([FörsäljningsId]) references [Försäljningar](Id),
	constraint [PK_ForsaljningsDetalier]
		primary key ([ISBN], [FörsäljningsId])
)



