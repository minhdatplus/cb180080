create table TB_ADJUSTED_RATE
(
    SYMBOL      VARCHAR2(50),
    ADJRATE     NUMBER,
    TRADINGDATE DATE,
    UPDATEDDATE DATE,
    APPLIED     NUMBER(1),
    ID          NUMBER generated as identity,
    EXCHANGE    VARCHAR2(20),
    CASTATUS    VARCHAR2(20),
    FLAG        VARCHAR2(200)
)

create table TB_MARKET_DATA
(
    STOCKTYPE         VARCHAR2(20),
    TRADINGDATE       DATE,
    TRADINGTIME       VARCHAR2(20),
    EXCHANGE          VARCHAR2(20),
    CONFIRMNO         VARCHAR2(20),
    STOCKNO           VARCHAR2(20),
    STOCKSYMBOL       VARCHAR2(20),
    TOTALVOL          NUMBER(18, 2),
    TOTALPRICE        NUMBER(18, 2),
    SIDE              VARCHAR2(20),
    ACCUMULATEDVOL    NUMBER(18, 2),
    ACCUMULATEDVAL    NUMBER(18, 2),
    HIGHEST           NUMBER(18, 2),
    LOWEST            NUMBER(18, 2),
    AVGPRICE          NUMBER,
    PRIORPRICE        NUMBER,
    TOTALMATCHEDVOL   NUMBER,
    ID                NUMBER not null,
    TOTALVOLUMETRADED NUMBER,
    TOTALVALUETRADED  NUMBER
)

create index TB_MD__INDEX
    on TB_MARKET_DATA (STOCKSYMBOL, TRADINGDATE)

create unique index TB_MARKET_DATA_ID_UINDEX
    on TB_MARKET_DATA (ID)

alter table TB_MARKET_DATA
    add constraint TB_MARKET_DATA_PK
        primary key (ID)

create table TB_DAILY_STOCK_INFO
(
    EXCHANGEID              NUMBER,
    STOCKSYMBOL             NVARCHAR2(50) default NULL,
    TRADINGDATE             DATE,
    PRIORPRICE              NUMBER,
    OPENPRICE               NUMBER,
    CLOSEPRICE              NUMBER,
    HIGHPRICE               NUMBER,
    LOWPRICE                NUMBER,
    AVGPRICE                NUMBER,
    TOTALQTTY               NUMBER,
    TOTALVALUE              NUMBER,
    BUYTOTALTRADE           NUMBER,
    BUYTOTALQTTY            NUMBER,
    SELLTOTALTRADE          NUMBER,
    SELLTOTALQTTY           NUMBER,
    OPENPRICE_ADJUSTED      NUMBER,
    CLOSEPRICE_ADJUSTED     NUMBER,
    HIGHPRICE_ADJUSTED      NUMBER,
    LOWPRICE_ADJUSTED       NUMBER,
    ID                      NUMBER not null,
    TOTALVOLUMETRADED       NUMBER,
    TOTALVALUETRADED        NUMBER,
    PRICECHANGE             NUMBER,
    PRICECHANGEPERCENTAGE   NUMBER,
    REFPRICE                NUMBER,
    CEILINGPRICE            NUMBER,
    FLOORPRICE              NUMBER,
    CLOSEPRICE_ADJUSTED_IDS NUMBER,
    HIGHPRICE_ADJUSTED_IDS  NUMBER,
    LOWPRICE_ADJUSTED_IDS   NUMBER,
    OPENPRICE_ADJUSTED_IDS  NUMBER,
    BIDCOUNT                NUMBER,
    TOTALBIDQTTY            NUMBER,
    OFFERCOUNT              NUMBER,
    TOTALOFFERQTTY          NUMBER,
    EXCHANGE                VARCHAR2(20)
)

create index TB_DSI_INDEX
    on TB_DAILY_STOCK_INFO (STOCKSYMBOL, TRADINGDATE)

create unique index TB_DAILY_STOCK_INFO_ID_UINDEX
    on TB_DAILY_STOCK_INFO (ID)

alter table TB_DAILY_STOCK_INFO
    add constraint TB_DAILY_STOCK_INFO_PK
        primary key (ID)

create table CR_TRADING_EXCHANGE
(
    ID            NUMBER default "ROOT"."ISEQ$$_94469".nextval generated as identity,
    CREATED_DATE  DATE   default CURRENT_DATE,
    MODIFIED_DATE DATE   default CURRENT_DATE,
    CREATOR_ID    NUMBER,
    EXCHANGE_CODE VARCHAR2(1000),
    EXCHANGE_NAME VARCHAR2(1000),
    MODIFIED_ID   NUMBER,
    IS_ACTIVE     NUMBER(1),
    IS_DELETED    NUMBER(1)
)

create table AD_NEWS
(
    ID               NUMBER not null
        primary key,
    CREATE_DATE      DATE,
    UPDATE_DATE      DATE,
    SYMBOL           VARCHAR2(1000),
    TITLE            VARCHAR2(1000),
    IMAGE_URL        VARCHAR2(1000),
    SHORT_CONTENT    VARCHAR2(1000),
    FULL_CONTENT     VARCHAR2(1000),
    NEWS_SOURCE      VARCHAR2(1000),
    SOURCE_CODE      VARCHAR2(1000),
    NEWS_SOURCE_LINK VARCHAR2(1000)
)

create table AD_CORPORATE
(
    ID                NUMBER not null
        primary key,
    SYMBOL            VARCHAR2(1000),
    EVENT_NAME        VARCHAR2(1000),
    EX_RIGHT_DATE     DATE,
    RECORD_DATE       DATE,
    ISSUE_DATE        DATE,
    EVENT_TITLE       VARCHAR2(1000),
    PUBLIC_DATE       VARCHAR2(1000),
    EXCHANGE          VARCHAR2(1000),
    EVENT_LIST_CODE   VARCHAR2(1000),
    VALUE             FLOAT,
    RATIO             FLOAT,
    EVENT_DESCRIPTION VARCHAR2(1000),
    EVENT_CODE        VARCHAR2(1000)
)

create table AD_COMPANY_PROFILE
(
    ID                    NUMBER not null
        primary key,
    SYMBOL                VARCHAR2(1000),
    SUB_SECTOR_CODE       VARCHAR2(3000),
    INDUSTRY_NAME         VARCHAR2(1000),
    SUPER_SECTOR          VARCHAR2(1000),
    SECTOR                VARCHAR2(1000),
    SUB_SECTOR            VARCHAR2(1000),
    FOUNDING_DATE         DATE,
    CHARTER_CAPITAL       FLOAT,
    NUMBER_OF_EMPLOYEE    NUMBER,
    BANK_NUMBER_OF_BRANCH NUMBER,
    COMPANY_PROFILE       VARCHAR2(1000),
    LISTING_DATE          DATE,
    EXCHANGE              VARCHAR2(1000),
    FIRST_PRICE           FLOAT,
    ISSUE_SHARE           FLOAT,
    LISTED_VALUE          FLOAT,
    COMPANY_NAME          VARCHAR2(1000),
    TYPE_NAME             VARCHAR2(1000),
    CREATED_TIME          TIMESTAMP(6) default CURRENT_TIMESTAMP,
    CREATE_DATE           DATE
)

create table AD_SHARE_HOLDER
(
    ID                   NUMBER not null
        primary key,
    OWNER_SYMBOL         VARCHAR2(1000),
    SYMBOL               VARCHAR2(1000),
    NAME                 VARCHAR2(1000),
    QUANTITY             FLOAT,
    PERCENTAGE           FLOAT,
    PUBLIC_DATE          DATE,
    OWNER_SHIP_TYPE_CODE VARCHAR2(100),
    TYPE                 VARCHAR2(100)
)

create table AD_FINANCE_INDICATOR
(
    ID                  NUMBER not null
        primary key,
    SYMBOL              VARCHAR2(1000),
    REVENUE             FLOAT,
    PROFIT              FLOAT,
    YEAR_REPORT         NUMBER,
    LENGTH_REPORT       NUMBER,
    EPS                 FLOAT,
    DILUTE_DEPS         FLOAT,
    PE                  FLOAT,
    ROE                 FLOAT,
    ROA                 FLOAT,
    ROIC                FLOAT,
    GROSS_PROFIT_MARGIN FLOAT,
    NET_PROFIT_MARGIN   FLOAT,
    DEBT_EQUITY         FLOAT,
    DEBT_ASSET          FLOAT,
    QUICK_RATIO         FLOAT,
    CURRENT_RATIO       FLOAT,
    PB                  FLOAT
)

create table AD_ASSET
(
    ID     NUMBER not null
        primary key,
    SYMBOL VARCHAR2(100),
    YEAR   NUMBER,
    ASSET  FLOAT
)

create table AD_CAPITAL
(
    ID            NUMBER not null
        primary key,
    SYMBOL        VARCHAR2(100),
    YEAR          NUMBER,
    OWNER_CAPITAL FLOAT
)

create table AD_CASH_DIVIDEND
(
    ID              NUMBER not null
        primary key,
    SYMBOL          VARCHAR2(100),
    YEAR            NUMBER,
    VALUE_PER_SHARE FLOAT
)