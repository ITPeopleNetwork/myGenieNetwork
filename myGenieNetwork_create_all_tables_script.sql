
-- ****************** MyGenieNetwork Database : Microsoft SQL Server ******************
-- ************************************************************************************
-- Create date:	February 10, 2020
-- Created by:	Cameron Beatley
-- Revision: 	version 1.0 - original scripts
-- ************************************************************************************
-- Change Log:
--
-- ************************************************************************************


-- ************************************************************************************
-- [contract]
-- ************************************************************************************
IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='contract')
CREATE TABLE [dbo].[contract]
(
 [contract_id]      uniqueidentifier ROWGUIDCOL NOT NULL ,
 [contract_type]    int NOT NULL ,
 [contract_info]    varchar(10) NOT NULL ,
 [genie_project_id] uniqueidentifier NOT NULL 

);
GO


-- ************************************************************************************
-- [customer]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='customer')
CREATE TABLE [dbo].[customer]
(
 [customer_id]    uniqueidentifier ROWGUIDCOL NOT NULL ,
 [customer_name]  nvarchar(40) NOT NULL ,
 [customer_phone] nvarchar(20) NULL ,

 CONSTRAINT [PK_customer_id] PRIMARY KEY CLUSTERED ([customer_id] ASC)
);
GO

--EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Basic information 
--about Customer', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'customer';
--GO


-- ************************************************************************************
-- [dental_plan_master]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='dental_plan_master')
CREATE TABLE [dbo].[dental_plan_master]
(
 [dental_plan_master_id] uniqueidentifier ROWGUIDCOL NOT NULL ,
 [plan_year]             date NOT NULL ,


 CONSTRAINT [PK_dental_plan_master] PRIMARY KEY NONCLUSTERED ([dental_plan_master_id] ASC)
);
GO


-- ************************************************************************************
-- [dbo].[dental_plan_status]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='dental_plan_status')
CREATE TABLE [dbo].[dental_plan_status]
(
 [dental_plan_status_id] uniqueidentifier ROWGUIDCOL NOT NULL ,
 [lapse_risk]            varchar(100) NOT NULL ,
 [lapse_reason]          varchar(255) NOT NULL ,
 [plan_status_id]        uniqueidentifier NOT NULL ,
 [dental_plan_id]        uniqueidentifier NOT NULL ,
 [profile_id]            uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_dental_plan_status_id] PRIMARY KEY NONCLUSTERED ([dental_plan_status_id] ASC)
);
GO


-- ************************************************************************************
-- [employee_genie_shortlist]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='employee_genie_shortlist')
CREATE TABLE [dbo].[employee_genie_shortlist]
(
 [employer_id]                 uniqueidentifier NOT NULL ,
 [employee_genie_shortlist_id] uniqueidentifier NOT NULL ,
 [profile_id]                  uniqueidentifier NOT NULL ,
 [shortlist_date]              datetime NOT NULL ,


 CONSTRAINT [PK_employee_genie_shortlist] PRIMARY KEY CLUSTERED ([employee_genie_shortlist_id] ASC)
 --,
 -- CONSTRAINT [FK_employer_id] FOREIGN KEY ([employer_id])  REFERENCES [dbo].[employer]([employer_id]),
 -- CONSTRAINT [FK_profile_id] FOREIGN KEY ([profile_id])  REFERENCES [dbo].[profile]([profile_id])
);
GO


--SKIP Index: [FK_employer_id]
--SKIP Index: [FK_profile_id]


-- ************************************************************************************
-- [employer]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='employer')
CREATE TABLE [dbo].[employer]
(
 [employer_id]       uniqueidentifier ROWGUIDCOL NOT NULL ,
 [employer_name]     varchar(100) NOT NULL ,
 [business_domain]   varchar(255) NOT NULL ,
 [address_line_1]    varchar(255) NOT NULL ,
 [primary_contact]   varchar(50) NOT NULL ,
 [user_Id]           varchar(50) NOT NULL ,
 [password]          varchar(50) NOT NULL ,
 [full_name]         varchar(100) NOT NULL ,
 [email_Id]          uniqueidentifier NOT NULL ,
 [phone_number]      bigint NOT NULL ,
 [employer_company]  varchar(100) NOT NULL ,
 [designation?]       varchar(100) NOT NULL ,
 [role]              nvarchar(50) NOT NULL ,
 [interest_or_topic] varchar(200) NOT NULL ,
 [linkedin_address]  varchar(100) NOT NULL ,
 [address_line_2]    varchar(255) NULL ,
 [address_line_3]    varchar(255) NOT NULL ,
 [city]              varchar(50) NOT NULL ,
 [state_province]    varchar(50) NOT NULL ,
 [postal_code]       varchar(10) NOT NULL ,
 [user_id_]          uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_Employer_profile] PRIMARY KEY CLUSTERED ([employer_id] ASC)
--,
-- CONSTRAINT [FK_user_id] FOREIGN KEY ([user_id_])  REFERENCES [dbo].[user]([user_id_])
);
GO

--SKIP Index: [FK_user_id]


-- ************************************************************************************
-- [dbo].[genie_account_setting]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='genie_account_setting')
CREATE TABLE [dbo].[genie_account_setting]
(
 [account_setting_id] uniqueidentifier ROWGUIDCOL NOT NULL ,
 [profile_id]         uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_genie_account_seetings] PRIMARY KEY CLUSTERED ([account_setting_id] ASC)
 --,
 -- CONSTRAINT [FK_profile_id] FOREIGN KEY ([profile_id])  REFERENCES [dbo].[profile]([profile_id])
);
GO


--SKIP Index: [FK_profile_id]


-- ************************************************************************************
-- [dbo].[genie_availability]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='genie_availability')
CREATE TABLE [dbo].[genie_availability]
(
 [genie_availability_id]   uniqueidentifier NOT NULL ,
 [profile_id]              uniqueidentifier NOT NULL ,
 [availability_date]       date NOT NULL ,
 [availability_year]       date NOT NULL ,
 [availability_hours]      int NOT NULL ,
 [availabiltiy_start_time] time(7) NOT NULL ,
 [availability_end_time]   time(7) NOT NULL ,

 CONSTRAINT [PK_genie_availability_id] PRIMARY KEY CLUSTERED ([genie_availability_id] ASC)
);
GO


-- ************************************************************************************
-- [dbo].[genie_background_check]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='genie_background_check')
CREATE TABLE [dbo].[genie_background_check]
(
 [genie_background_check_id]        uniqueidentifier ROWGUIDCOL NOT NULL ,
 [background_check_complete]        bit NOT NULL ,
 [background_document_link]         varchar(100) NOT NULL ,
 [background_check_expiration_date] datetime NOT NULL ,
 [profile_id]                       uniqueidentifier NOT NULL ,

CONSTRAINT [PK_genie_background_check_id] PRIMARY KEY CLUSTERED ([genie_background_check_id] ASC)
 -- CONSTRAINT [FK_profile_id] FOREIGN KEY ([profile_id])REFERENCES [dbo].[profile]([profile_id])
);
GO


--SKIP Index: [FK_profile_id]

-- ************************************************************************************
-- [dbo].[genie_bank]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='genie_bank')
CREATE TABLE [dbo].[genie_bank]
(
 [genie_bank_id]       uniqueidentifier ROWGUIDCOL NOT NULL ,
 [profile_id]          uniqueidentifier NOT NULL ,
 [bank_name]           varchar(255) NOT NULL ,
 [bank_routing_number] int NOT NULL ,
 [account_number]      int NOT NULL ,


 CONSTRAINT [PK_Genie_Bank] PRIMARY KEY CLUSTERED ([genie_bank_id] ASC)
);
GO


-- ************************************************************************************
-- [dbo].[genie_dental_plan]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='genie_dental_plan')
CREATE TABLE [dbo].[genie_dental_plan]
(
 [profile_id]            uniqueidentifier NOT NULL ,
 [genie_dental_plan_id]  uniqueidentifier NOT NULL ,
 [plan_start_date]       datetime NOT NULL ,
 [plan_end_date]         datetime NOT NULL ,
 [plan_status]           smallint NOT NULL ,
 [dental_plan_master_id] uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_Genie_Health_Plan] PRIMARY KEY CLUSTERED ([genie_dental_plan_id] ASC)
 --,
 --CONSTRAINT [FK_profile_id] FOREIGN KEY ([profile_id])  REFERENCES [dbo].[profile]([profile_id]),
 --CONSTRAINT [FK_dental_plan_master_id] FOREIGN KEY ([dental_plan_master_id])  REFERENCES [dbo].[dental_plan_master]([dental_plan_master_id])
);
GO
--SKIP Index: [FK_dental_plan_master_id]
--SKIP Index: [FK_profile_id]


-- ************************************************************************************
-- [dbo].[genie_employer_rating]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='genie_employer_rating')
CREATE TABLE [dbo].[genie_employer_rating]
(
 [genie_employer_rating_id] uniqueidentifier NOT NULL ,
 [genie_project_id]         uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_genie_employer_rating] PRIMARY KEY CLUSTERED ([genie_employer_rating_id] ASC)
);
GO


-- ************************************************************************************
-- [dbo].[genie_inspection]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='genie_inspection')
CREATE TABLE [dbo].[genie_inspection]
(
 [inspection_id] uniqueidentifier ROWGUIDCOL NOT NULL ,
 [profile_id]    uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_genie_inspection_id] PRIMARY KEY CLUSTERED ([inspection_id] ASC)
);
GO

--SKIP Index: [FK_profile_id]


-- ************************************************************************************
-- [dbo].[genie_invoice]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='genie_invoice')
CREATE TABLE [dbo].[genie_invoice]
(
 [genie_invoice_id]  uniqueidentifier NOT NULL ,
 [genie_project_id]  uniqueidentifier NOT NULL ,
 [invoice_no]        varchar(20) NOT NULL ,
 [invoice_date]      date NOT NULL ,
 [invoice_submitted] date NOT NULL ,

 CONSTRAINT [PK_genie_invoice_id] PRIMARY KEY CLUSTERED ([genie_invoice_id] ASC)
 --,
 --CONSTRAINT [FK_genie_project_id] FOREIGN KEY ([genie_project_id])  REFERENCES [dbo].[genie_project]([genie_project_id])
);
GO

--SKIP Index: [PK_genie_invoice_id]
--SKIP Index: [FK_genie_project_id]


-- ************************************************************************************
-- [dbo].[genie_ip]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='genie_ip')
CREATE TABLE [dbo].[genie_ip]
(
 [genie_ip_id] uniqueidentifier ROWGUIDCOL NOT NULL ,
 [profile_id]  uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_genie_IP] PRIMARY KEY CLUSTERED ([genie_ip_id] ASC)
);
GO

--SKIP Index: [FK_profile_id]


-- ************************************************************************************
-- [dbo].[genie_ip_transaction]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='genie_ip_transaction')
CREATE TABLE [dbo].[genie_ip_transaction]
(
 [genie_ip_transaction_id] uniqueidentifier ROWGUIDCOL NOT NULL ,
 [genie_ip_id]             uniqueidentifier NOT NULL ,
 [ip_invoice]              varchar(10) NOT NULL ,
 [invoice_date]            date NOT NULL ,
 [Invoice_amount]          decimal(9,2) NULL ,


 CONSTRAINT [PK_genie_ip_transaction_id] PRIMARY KEY CLUSTERED ([genie_ip_transaction_id] ASC)
 --,
 --CONSTRAINT [FK_genie_ip_id] FOREIGN KEY ([genie_ip_id])  REFERENCES [dbo].[genie_ip]([genie_ip_id])
);
GO

--SKIP Index: [FK_genie_ip_id]


-- ************************************************************************************
-- [dbo].[genie_monthly_deduction]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='genie_monthly_deduction')
CREATE TABLE [dbo].[genie_monthly_deduction]
(
 [genie_monthly_deduction_id] uniqueidentifier ROWGUIDCOL NOT NULL ,
 [deduction_year]             int,
 [deduction_month]            varchar(15) NOT NULL ,
 [deduction_vision]           decimal(9,2) NOT NULL ,
 [deduction_health]           decimal(9,2) NOT NULL ,
 [deduction_dental]           decimal(9,2) NOT NULL ,
 [deduction_vision_account]   int NOT NULL ,
 [deduction_health_account]   int NOT NULL ,
 [deduction_dental_accountt]  int NOT NULL ,
 [profile_id]                 uniqueidentifier NOT NULL ,
 [last_payment_date]          date NOT NULL ,


 CONSTRAINT [PK_genie_deduction_id] PRIMARY KEY CLUSTERED ([genie_monthly_deduction_id] ASC)
 --,
 --CONSTRAINT [FK_profile_id] FOREIGN KEY ([profile_id])  REFERENCES [dbo].[profile]([profile_id])
);
GO

--SKIP Index: [FK_profile_id]


-- ************************************************************************************
-- [dbo].[genie_medical_plan]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='genie_medical_plan')
CREATE TABLE [dbo].[genie_medical_plan]
(
 [genie_medical_plan_id]  uniqueidentifier NOT NULL ,
 [profile_id]             uniqueidentifier NOT NULL ,
 [medical_plan_master_id] uniqueidentifier NOT NULL ,
 [plan_start_date]        datetime NOT NULL ,
 [plan_end_date]          datetime NOT NULL ,
 [plan_status]            smallint NOT NULL ,


 CONSTRAINT [PK_genie_medical_plan_id] PRIMARY KEY CLUSTERED ([genie_medical_plan_id] ASC)
 --,
 --CONSTRAINT [FK_profile_id] FOREIGN KEY ([profile_id])  REFERENCES [dbo].[profile]([profile_id]),
 --CONSTRAINT [FK_medical_plan_master_id] FOREIGN KEY ([medical_plan_master_id])  REFERENCES [dbo].[medical_plan_master]([medical_plan_master_id])
);
GO


--SKIP Index: [FK_medical_plan_master_id]
--SKIP Index: [FK_profile_id]


-- ************************************************************************************
-- [dbo].[genie_opportunity_applied]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='genie_opportunity_applied')
CREATE TABLE [dbo].[genie_opportunity_applied]
(
 [genie_opportunity_applied_id] uniqueidentifier ROWGUIDCOL NOT NULL ,
 [opportunity_status]           varchar(10) NOT NULL ,
 [profile_id]                   uniqueidentifier NOT NULL ,
 [project_role_id]              uniqueidentifier NULL ,


 CONSTRAINT [PK_genie_opportunity_applied] PRIMARY KEY CLUSTERED ([genie_opportunity_applied_id] ASC)
 --,
 --CONSTRAINT [FK_profile_id] FOREIGN KEY ([profile_id])  REFERENCES [dbo].[profile]([profile_id]),
 --CONSTRAINT [FK_genie_opportunity_applied_id] FOREIGN KEY ([project_role_id])  REFERENCES [dbo].[project_role]([project_role_id])
);
GO

--SKIP Index: [FK_profile_id]
--SKIP Index: [FK_project_role_id]


-- ************************************************************************************
-- [dbo].[genie_opportunity_workflow]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='genie_opportunity_workflow')
CREATE TABLE [dbo].[genie_opportunity_workflow]
(
 [genie_opportunity_workflow_id] uniqueidentifier ROWGUIDCOL NOT NULL ,
 [workflow_name]                 varchar(255) NOT NULL ,
 [workflow_start_date]           date NOT NULL ,
 [workflow_end_date]             date NOT NULL ,
 [next_workflow_id]              uniqueidentifier NOT NULL ,
 [workflow_status]               varchar(100) NOT NULL ,
 [genie_opportunity_applied_id]  uniqueidentifier NOT NULL ,
 [project_id]                    uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_genie_opportunity_workflow_id] PRIMARY KEY CLUSTERED ([genie_opportunity_workflow_id] ASC)
 --,
 --CONSTRAINT [FK_genie_opportunity_applied_id] FOREIGN KEY ([genie_opportunity_applied_id])  REFERENCES [dbo].[genie_opportunity_applied]([genie_opportunity_applied_id]),
 --CONSTRAINT [FK_project_id] FOREIGN KEY ([project_id])  REFERENCES [dbo].[project]([project_id])
);
GO

--SKIP Index: [FK_genie_opportunity_applied_id]
--SKIP Index: [FK_project_id]


-- ************************************************************************************
-- [dbo].[genie_project]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='genie_project')
CREATE TABLE [dbo].[genie_project]
(
 [genie_project_id]    uniqueidentifier NOT NULL,
 [project_name]        varchar(50) NOT NULL ,
 [role_id]             int NOT NULL ,
 [project_start_date]  datetime NOT NULL ,
 [project_end_date]    datetime NOT NULL ,
 [project_status]      int NOT NULL ,
 [profile_id]          uniqueidentifier NOT NULL ,
 [employer_id]         uniqueidentifier NOT NULL ,
 [manager_name]        varchar(100) NOT NULL ,
 [contract_start_date] date NOT NULL ,
 [contract_end_date]   date NOT NULL ,
 [contract_status]     varchar(50) NOT NULL ,


 CONSTRAINT [PK_Genie_Project] PRIMARY KEY CLUSTERED ([genie_project_id] ASC)
 --,
 --CONSTRAINT [FK_profile_id] FOREIGN KEY ([profile_id])  REFERENCES [dbo].[profile]([profile_id]),
 --CONSTRAINT [FK_employer_id] FOREIGN KEY ([employer_id])  REFERENCES [dbo].[employer]([employer_id])
);
GO

--SKIP Index: [FK_employer_id]
--SKIP Index: [FK_profile_id]


-- ************************************************************************************
-- [dbo].[genie_payment]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) 
WHERE s.name='dbo' and t.name='genie_payment')
CREATE TABLE [dbo].[genie_payment]
(
 [genie_payment_id] uniqueidentifier ROWGUIDCOL NOT NULL ,
 [check_no]         varchar(50) NOT NULL ,
 [check_amt]        decimal(9,2) NOT NULL ,
 [check_issue_date] date NOT NULL ,
 [genie_invoice_id] uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_genie_payment_id] PRIMARY KEY CLUSTERED ([genie_payment_id] ASC)
 --,
 -- CONSTRAINT [FK_genie_invoice_id] FOREIGN KEY ([genie_invoice_id])  REFERENCES [dbo].[genie_invoice]([genie_invoice_id])
);
GO

--SKIP Index: [FK_genie_invoice_id]


-- ************************************************************************************
-- [dbo].[genie_project_performance]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='genie_project_performance')
CREATE TABLE [dbo].[genie_project_performance]
(
 [genie_project_performance_id] uniqueidentifier NOT NULL ,
 [genie_project_id]             uniqueidentifier NOT NULL ,
 [performance_rating]           varchar(50) NOT NULL ,
 [performance_rating_score]     decimal(18,0) NOT NULL ,
 [performance_rating_submitter] uniqueidentifier NOT NULL ,
 [performance_rating_date]      date NOT NULL ,


 CONSTRAINT [PK_genie_project_performance_id] PRIMARY KEY CLUSTERED ([genie_project_performance_id] ASC)
 --,
 --CONSTRAINT [FK_genie_project_id] FOREIGN KEY ([genie_project_id])  REFERENCES [dbo].[genie_project]([genie_project_id])
);
GO

--SKIP Index: [FK_genie_project_id]


-- ************************************************************************************
-- [dbo].[genie_qualification_score]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='genie_qualification_score')
CREATE TABLE [dbo].[genie_qualification_score]
(
 [genie_qualification_score_id] uniqueidentifier ROWGUIDCOL NOT NULL ,
 [genie_inspection_id]          uniqueidentifier NOT NULL ,
 [genie_employer_rating_id]     uniqueidentifier NOT NULL ,
 [genie_background_check_id]    uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_genie_qual_score] PRIMARY KEY CLUSTERED ([genie_qualification_score_id] ASC),
 --CONSTRAINT [FK_genie_inspection_id] FOREIGN KEY ([genie_inspection_id])  REFERENCES [dbo].[genie_inspection]([genie_inspection_id]),
 --CONSTRAINT [FK_genie_employer_rating_id] FOREIGN KEY ([genie_employer_rating_id])  REFERENCES [dbo].[genie_employer_rating]([genie_employer_rating_id]),
 --CONSTRAINT [FK_genie_background_check_id] FOREIGN KEY ([genie_background_check_id])  REFERENCES [dbo].[genie_background_check]([genie_background_check_id])
);
GO

--SKIP Index: [FK_genie_background_check_id]
--SKIP Index: [FK_genie_employer_rating_id]
--SKIP Index: [FK_genie_inspection_id]


-- ************************************************************************************
-- [dbo].[genie_retirement_plan]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='genie_retirement_plan')
CREATE TABLE [dbo].[genie_retirement_plan]
(
 [genie_retirement_plan_id]  uniqueidentifier ROWGUIDCOL NOT NULL ,
 [profile_id]                uniqueidentifier NOT NULL ,
 [retirement_plan_option_id] uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_genie_retirement_plan] PRIMARY KEY CLUSTERED ([genie_retirement_plan_id] ASC)
 --,
 --CONSTRAINT [FK_profile_id] FOREIGN KEY ([profile_id])  REFERENCES [dbo].[profile]([profile_id]),
 --CONSTRAINT [FK_retirement_plan_option_id] FOREIGN KEY ([retirement_plan_option_id])  REFERENCES [dbo].[retirement_plan_option]([retirement_plan_option_id])
);
GO

--SKIP Index: [FK_profile_id]
--SKIP Index: [FK_retirement_plan_option_id]


-- ************************************************************************************
-- [dbo].[genie_timesheet]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='genie_timesheet')
CREATE TABLE [dbo].[genie_timesheet]
(
 [genie_timesheet_id]   int NOT NULL ,
 [genie_project_id]     uniqueidentifier NOT NULL ,
 [timesheet_start_date] date NOT NULL ,
 [timesheet_end_date]   date NOT NULL ,
 [timesheet_date]       date NOT NULL ,
 [timesheet_day]        int NOT NULL ,
 [timesheet_minute]     int NOT NULL ,
 [timesheet_submitted]  int NOT NULL ,
 [timesheet_approved]   int NOT NULL ,


 CONSTRAINT [FK_genie_project_id] FOREIGN KEY ([genie_project_id])  REFERENCES [dbo].[genie_project]([genie_project_id])
);
GO

--SKIP Index: [PK_genie_timesheet_id]
--SKIP Index: [K_genie_project_id]


-- ************************************************************************************
-- [dbo].[genie_vision_plan]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='genie_vision_plan')
CREATE TABLE [dbo].[genie_vision_plan]
(
 [genie_vision_plan_id]  uniqueidentifier ROWGUIDCOL NOT NULL ,
 [profile_id]            uniqueidentifier NOT NULL ,
 [plan_start_date]       datetime NOT NULL ,
 [plan_end_date]         datetime NOT NULL ,
 [plan_status]           smallint NOT NULL ,
 [vision_plan_master_id] uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_genie_vision_plan_id] PRIMARY KEY CLUSTERED ([genie_vision_plan_id] ASC)
 --,
 --CONSTRAINT [FK_profile_id] FOREIGN KEY ([profile_id])  REFERENCES [dbo].[profile]([profile_id])
);
GO

--SKIP Index: [FK_profile_id]


-- ************************************************************************************
-- [dbo].[genie_vision_plan]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='genie_vision_plan')
CREATE TABLE [dbo].[genie_vision_plan]
(
 [genie_vision_plan_id]  uniqueidentifier ROWGUIDCOL NOT NULL ,
 [profile_id]            uniqueidentifier NOT NULL ,
 [plan_start_date]       datetime NOT NULL ,
 [plan_end_date]         datetime NOT NULL ,
 [plan_status]           smallint NOT NULL ,
 [vision_plan_master_id] uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_genie_vision_plan_id] PRIMARY KEY CLUSTERED ([genie_vision_plan_id] ASC)
 --,
 --CONSTRAINT [FK_profile_id] FOREIGN KEY ([profile_id])  REFERENCES [dbo].[profile]([profile_id])
);
GO
--SKIP Index: [FK_profile_id]

-- ************************************************************************************
-- [dbo].[medical_plan_master]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='medical_plan_master')
CREATE TABLE [dbo].[medical_plan_master]
(
 [medical_plan_master_id] uniqueidentifier NOT NULL ,
 [plan_year]              date NOT NULL ,
 [plan_provider_id]       uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_medical_plan_master_id] PRIMARY KEY CLUSTERED ([medical_plan_master_id] ASC)
 --,
 --CONSTRAINT [FK_plan_provider_id] FOREIGN KEY ([plan_provider_id])  REFERENCES [dbo].[plan_provider]([plan_provider_id])
);
GO

--SKIP Index: [FK_plan_provider_id]


-- ************************************************************************************
-- [dbo].[medical_plan_status]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='medical_plan_status')
CREATE TABLE [dbo].[medical_plan_status]
(
 [medical_plan_status_id] uniqueidentifier ROWGUIDCOL NOT NULL ,
 [risk_of_lapse]          varchar(50) NOT NULL ,
 [lapse_reason]           varchar(5) NOT NULL ,
 [plan_status_id]         uniqueidentifier NOT NULL ,
 [medical_plan_master_id] uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_medical_plan_status_id] PRIMARY KEY CLUSTERED ([medical_plan_status_id] ASC)
 --,
 --CONSTRAINT [FK_medical_plan_master_id] FOREIGN KEY ([medical_plan_master_id])  REFERENCES [dbo].[genie_medical_plan]([genie_medical_plan_id])
);
GO


--SKIP Index: [FK_medical_plan_master_id]


-- ************************************************************************************
-- [dbo].[order]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='order')
CREATE TABLE [dbo].[order]
(
 [order_Id]     uniqueidentifier ROWGUIDCOL NOT NULL ,
 [order_number] nvarchar(10) NULL ,
 [customer_id]  uniqueidentifier NOT NULL ,
 [order_date]   datetime NOT NULL CONSTRAINT [DF_order_order_date] DEFAULT (getdate()) ,
 [total_amount] decimal(12,2) NOT NULL 

);
GO

--SKIP Index: [PK_order_id]

--EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Order information
--like Date, Amount', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'order';
GO


-- ************************************************************************************
-- [dbo].[order_Item]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='order_Item')
CREATE TABLE [dbo].[order_Item]
(
 [product_Id]    uniqueidentifier NOT NULL ,
 [unit_price]    decimal(12,2) NOT NULL ,
 [order_item_id] uniqueidentifier ROWGUIDCOL NOT NULL ,


 CONSTRAINT [PK_order_Item_id] PRIMARY KEY CLUSTERED ([order_item_id] ASC)
 --,
 --CONSTRAINT [FK_product_id] FOREIGN KEY ([product_Id])  REFERENCES [dbo].[product]([product_id])
);
GO


--SKIP Index: [FK_product_id]


--EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Information about
--like Price, Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'order_Item';
GO


-- ************************************************************************************
-- [dbo].[product]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='product')
CREATE TABLE [dbo].[product]
(
 [product_id]   uniqueidentifier ROWGUIDCOL NOT NULL ,
 [product_name] nvarchar(50) NOT NULL ,
 [supplier_Id]  uniqueidentifier NOT NULL ,
 [unit_price]   decimal(12,2) NULL ,
 [discontinued] bit NOT NULL CONSTRAINT [DF_product_discontinued] DEFAULT ((0)) ,


 CONSTRAINT [PK_product_id] PRIMARY KEY CLUSTERED ([product_id] ASC)
 --,
 --CONSTRAINT [FK_Product_SupplierId_Supplier] FOREIGN KEY ([supplier_Id])  REFERENCES [dbo].[supplier]([supplier_Id])
);
GO


--SKIP Index: [FK_supplierI_id]

--EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Basic information 
--about Product', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'product';
GO


-- ************************************************************************************
-- [dbo].[profile]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='profile')
CREATE TABLE [dbo].[profile]
(
 [profile_id]       uniqueidentifier NOT NULL ,
 [current_role]     int NOT NULL ,
 [experience]       numeric(4,2) NOT NULL ,
 [user_name]        varchar(20) NOT NULL ,
 [email_Id]         varchar(50) NOT NULL ,
 [enter_password]   varchar(10) NOT NULL ,
 [confirm_password] varchar(10) NOT NULL ,
 [industry]         varchar(100) NOT NULL ,
 [specialization]   varchar(100) NOT NULL ,
 [location]         varchar(50) NOT NULL ,
 [full_name]        varchar(60) NOT NULL ,
 [hourly_rate]      varchar(50) NOT NULL ,
 [skill]            varchar(100) NOT NULL ,
 [gender]           varchar(50) NOT NULL ,
 [designation?]     varchar(100) NOT NULL ,
 [linkedin?]        nvarchar(200) NOT NULL ,
 [phone_number]     bigint NOT NULL ,


 CONSTRAINT [PK_profile_id] PRIMARY KEY CLUSTERED ([profile_id] ASC)
);
GO


-- ************************************************************************************
-- [dbo].[project]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='project')
CREATE TABLE [dbo].[project]
(
 [project_id]         uniqueidentifier ROWGUIDCOL NOT NULL,
 [employer_id]        uniqueidentifier NOT NULL ,
 [project_start_date] date NOT NULL ,
 [project_end_date]   date NOT NULL ,
 [industry]           varchar(100) NOT NULL ,
 [department]         varchar(100) NOT NULL ,
 [discipline]         varchar(100) NOT NULL ,
 [focus_area]         varchar(100) NOT NULL ,
 [specifics]          varchar(100) NOT NULL ,
 [project_duration]   varchar(100) NOT NULL ,


 CONSTRAINT [PK_project_id] PRIMARY KEY NONCLUSTERED ([project_id] ASC)
 --,
 --CONSTRAINT [FK_employer_id] FOREIGN KEY ([employer_id])  REFERENCES [dbo].[employer]([employer_id])
);
GO

--SKIP Index: [FK_employer_id]

GO


-- ************************************************************************************
-- [dbo].[project_role]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='project_role')
CREATE TABLE [dbo].[project_role]
(
 [project_role_id]      uniqueidentifier ROWGUIDCOL NOT NULL,
 [job_role_description] varchar(255) NOT NULL ,
 [industry]             varchar(100) NOT NULL ,
 [department]           varchar(100) NOT NULL ,
 [discipline]           varchar(100) NOT NULL ,
 [focus_area]           varchar(100) NOT NULL ,
 [role_start_date]      date NOT NULL ,
 [role_end_date]        date NOT NULL ,
 [role_duration]        int NOT NULL ,
 [project_id]           uniqueidentifier NOT NULL ,
 [nature_of_role]       varchar(100) NOT NULL ,


 CONSTRAINT [PK_project_role] PRIMARY KEY CLUSTERED ([project_role_id] ASC)
 --,
 --CONSTRAINT [FK_project_id] FOREIGN KEY ([project_id])  REFERENCES [dbo].[project]([project_id])
);
GO

--SKIP Index: [FK_project_id]
GO


-- ************************************************************************************
-- [dbo].[retirement_plan_provider]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='retirement_plan_provider')
CREATE TABLE [dbo].[retirement_plan_provider]
(
 [retirement_plan_provider_id] uniqueidentifier ROWGUIDCOL NOT NULL ,
 [provider_name]               varchar(50) NOT NULL ,


 CONSTRAINT [PK_retirement_plan_provider_id] PRIMARY KEY CLUSTERED ([retirement_plan_provider_id] ASC)
);
GO


-- ************************************************************************************
-- dbo].[retirement_plan_option]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='retirement_plan_option')
CREATE TABLE [dbo].[retirement_plan_option]
(
 [retirement_plan_option_id]   uniqueidentifier ROWGUIDCOL NOT NULL ,
 [retirement_plan_provider_id] uniqueidentifier NOT NULL ,
 [profile_id]                  uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_retirement_plan_options] PRIMARY KEY CLUSTERED ([retirement_plan_option_id] ASC)
 --,
 --CONSTRAINT [FK_retirement_plan_provider_id] FOREIGN KEY ([retirement_plan_provider_id])  REFERENCES [dbo].[retirement_plan_provider]([retirement_plan_provider_id]),
 --CONSTRAINT [FK_profile_id] FOREIGN KEY ([profile_id])  REFERENCES [dbo].[profile]([profile_id])
);
GO


--SKIP Index: [FK_profile_id]
--SKIP Index: [FK_retirement_plan_provider_id]
GO


-- ************************************************************************************
-- [dbo].[statement_of_work]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='statement_of_work')
CREATE TABLE [dbo].[statement_of_work]
(
 [statement_of_work_id]       uniqueidentifier NOT NULL ,
 [genie_project_id]           uniqueidentifier NOT NULL ,
 [profile_id]                 uniqueidentifier NOT NULL ,
 [project_role_id]            uniqueidentifier NOT NULL ,
 [statement_of_work_document] nvarchar(255) NOT NULL ,
 [statement_of_work_date]     date NOT NULL ,
 [contract_id]                uniqueidentifier NOT NULL ,

 CONSTRAINT [PK_statement_of_work] PRIMARY KEY CLUSTERED ([statement_of_work_id] ASC)
 --,
 --CONSTRAINT [FK_contract_id] FOREIGN KEY ([contract_id])  REFERENCES [dbo].[contract]([contract_id]),
 --CONSTRAINT [FK_genie_project_id] FOREIGN KEY ([genie_project_id])  REFERENCES [dbo].[genie_project]([genie_project_id]),
 --CONSTRAINT [FK_project_id] FOREIGN KEY ([profile_id])  REFERENCES [dbo].[profile]([profile_id]),
 --CONSTRAINT [FK_project_role_id] FOREIGN KEY ([project_role_id])  REFERENCES [dbo].[project_role]([project_role_id])
);
GO

--SKIP Index: [FK_contract_id]
--SKIP Index: [FK_genie_project_id]
--SKIP Index: [FK_profile_id]
--SKIP Index: [FK_project_role_id]
GO


-- ************************************************************************************
-- [dbo].[supplier]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='supplier')
CREATE TABLE [dbo].[supplier]
(
 [supplier_Id]    uniqueidentifier ROWGUIDCOL NOT NULL,
 [supplier_name]  nvarchar(40) NOT NULL ,
 [supplier_phone] nvarchar(20) NULL ,

 CONSTRAINT [PK_supplier_id] PRIMARY KEY CLUSTERED ([supplier_Id] ASC)
);
GO


--EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Basic information 
--about Supplier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supplier';
GO


-- ************************************************************************************
-- [dbo].[vision_plan_master]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='vision_plan_master')
CREATE TABLE [dbo].[vision_plan_master]
(
 [vision_plan_master_id] uniqueidentifier ROWGUIDCOL NOT NULL ,
 [plan_year]             date NOT NULL ,
 [plan_provider_id]      uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_vision_plan_master_id] PRIMARY KEY CLUSTERED ([vision_plan_master_id] ASC)
 --,
 --CONSTRAINT [FK_245] FOREIGN KEY ([plan_provider_id])  REFERENCES [dbo].[plan_provider]([plan_provider_id])
);
GO


--SKIP Index: [FK_plan_provider_id]
GO


-- ************************************************************************************
--  [dbo].[vision_plan_status]
-- ************************************************************************************

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='vision_plan_status')
CREATE TABLE [dbo].[vision_plan_status]
(
 [vision_plan_status_id] uniqueidentifier ROWGUIDCOL NOT NULL,
 [lapse_risk]            varchar(50) NOT NULL ,
 [lapse_reason]          varchar(50) NOT NULL ,
 [plan_status_id]        uniqueidentifier NOT NULL ,
 [genie_vision_plan_id]  uniqueidentifier NOT NULL ,


 CONSTRAINT [PK_vision_plan_status_id] PRIMARY KEY CLUSTERED ([vision_plan_status_id] ASC)
 --,
 --CONSTRAINT [FK_386] FOREIGN KEY ([genie_vision_plan_id])  REFERENCES [dbo].[genie_vision_plan]([genie_vision_plan_id])
);
GO

--SKIP Index: [FK_genie_vision_plan_id]
