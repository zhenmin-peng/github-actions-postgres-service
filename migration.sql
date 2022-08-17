CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;


DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20220805154421_Init') THEN
    CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20220805154421_Init') THEN
    CREATE TABLE "ClientPermissions" (
        "ClientId" uuid NOT NULL,
        "UserId" uuid NOT NULL,
        "Id" uuid NOT NULL,
        "Permission" integer NOT NULL,
        "IsDeleted" boolean NOT NULL,
        "Added_UserId" uuid NOT NULL,
        "Added_SessionId" text NOT NULL,
        "Added_CorrelationId" text NOT NULL,
        "Added_Timestamp" timestamp with time zone NOT NULL,
        "Deleted_UserId" uuid NULL,
        "Deleted_SessionId" text NULL,
        "Deleted_CorrelationId" text NULL,
        "Deleted_Timestamp" timestamp with time zone NULL,
        CONSTRAINT "PK_ClientPermissions" PRIMARY KEY ("ClientId", "UserId", "Id")
    );
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20220805154421_Init') THEN
    CREATE TABLE "Clients" (
        "ClientId" uuid NOT NULL,
        "IsPublic" boolean NOT NULL,
        "Owner" uuid NOT NULL,
        "SequenceNumber" integer NOT NULL,
        "IsDeleted" boolean NOT NULL,
        CONSTRAINT "PK_Clients" PRIMARY KEY ("ClientId")
    );
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20220805154421_Init') THEN
    CREATE TABLE pricing_data_v1 (
        client_id uuid NOT NULL,
        submission_id uuid NOT NULL,
        worksheet_id uuid NOT NULL,
        pricing_table_line_id uuid NOT NULL,
        timestamp timestamp with time zone NOT NULL,
        currency_id uuid NOT NULL,
        product_id uuid NOT NULL,
        sector_id integer NOT NULL,
        coupon_type_id integer NOT NULL,
        is_synthetic boolean NOT NULL,
        reference_rate_id uuid NOT NULL,
        live_spread numeric NULL,
        fee numeric NULL,
        fee_adjusted_to_duration numeric NULL,
        spread_vs_mid_swaps numeric NULL,
        spread_vs_government_benchmark numeric NULL,
        yield_annual numeric NULL,
        yield_semi_annual numeric NULL,
        yield_quarterly numeric NULL,
        government_benchmark text NULL,
        government_benchmark_yield numeric NULL,
        government_benchmark_interpolated_yield numeric NULL,
        coupon_annual numeric NULL,
        coupon_semi_annual numeric NULL,
        g_spread_mid numeric NULL,
        mid_swap_rate numeric NULL,
        interpolated_curve_mid numeric NULL,
        new_issue_premium_mid numeric NULL,
        interpolated_curve_bid numeric NULL,
        new_issue_premium_bid numeric NULL,
        spread_vs_three_month_eur numeric NULL,
        spread_vs_three_month_usd numeric NULL,
        spread_vs_three_month_gbp numeric NULL,
        spread_vs_six_month_eur numeric NULL,
        spread_vs_six_month_usd numeric NULL,
        spread_vs_six_month_gbp numeric NULL,
        spread_vs_estr numeric NULL,
        spread_vs_sofr numeric NULL,
        spread_vs_sonia numeric NULL,
        spread_vs_three_month_bbsw numeric NULL,
        spread_vs_three_month_cdor numeric NULL,
        spread_vs_three_month_stibor numeric NULL,
        spread_vs_three_month_cnh_hibor numeric NULL,
        spread_vs_three_month_hkd_hibor numeric NULL,
        spread_vs_sora numeric NULL,
        eur_swap_yield_annual numeric NULL,
        eur_swap_yield_semi_annual numeric NULL,
        eur_swap_yield_quarterly numeric NULL,
        usd_swap_yield_annual numeric NULL,
        usd_swap_yield_semi_annual numeric NULL,
        usd_swap_yield_quarterly numeric NULL,
        gbp_swap_yield_annual numeric NULL,
        gbp_swap_yield_semi_annual numeric NULL,
        gbp_swap_yield_quarterly numeric NULL,
        aud_swap_yield_annual numeric NULL,
        aud_swap_yield_semi_annual numeric NULL,
        aud_swap_yield_quarterly numeric NULL,
        cad_swap_yield_annual numeric NULL,
        cad_swap_yield_semi_annual numeric NULL,
        cad_swap_yield_quarterly numeric NULL,
        sek_swap_yield_annual numeric NULL,
        sek_swap_yield_semi_annual numeric NULL,
        sek_swap_yield_quarterly numeric NULL,
        cnh_swap_yield_annual numeric NULL,
        cnh_swap_yield_semi_annual numeric NULL,
        cnh_swap_yield_quarterly numeric NULL,
        hkd_swap_yield_annual numeric NULL,
        hkd_swap_yield_semi_annual numeric NULL,
        hkd_swap_yield_quarterly numeric NULL,
        sgd_swap_yield_annual numeric NULL,
        sgd_swap_yield_semi_annual numeric NULL,
        sgd_swap_yield_quarterly numeric NULL,
        assumed_tenor numeric(12,5) NOT NULL,
        assumed_tenor_display_as text NOT NULL,
        is_deleted boolean NOT NULL,
        assumed_maturity timestamp with time zone NULL,
        coupon_frequency_id integer NULL,
        use_bond_vernacular boolean NULL,
        display_as text NULL,
        comps_monitor_timestamp timestamp with time zone NULL,
        CONSTRAINT "PK_pricing_data_v1" PRIMARY KEY (client_id, submission_id, worksheet_id, pricing_table_line_id, timestamp)
    );
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20220805154421_Init') THEN
    SELECT create_hypertable('pricing_data_v1', 'timestamp');
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20220805154421_Init') THEN
    CREATE INDEX "IX_ClientPermissions_ClientId_IsDeleted" ON "ClientPermissions" ("ClientId", "IsDeleted");
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20220805154421_Init') THEN
    CREATE INDEX "IX_ClientPermissions_UserId_IsDeleted" ON "ClientPermissions" ("UserId", "IsDeleted");
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20220805154421_Init') THEN
    CREATE INDEX "IX_Clients_ClientId_IsDeleted" ON "Clients" ("ClientId", "IsDeleted");
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20220805154421_Init') THEN
    CREATE INDEX "IX_Clients_ClientId_IsPublic" ON "Clients" ("ClientId", "IsPublic");
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20220805154421_Init') THEN
    CREATE INDEX "IX_pricing_data_v1_client_id_currency_id_product_id_sector_id_~" ON pricing_data_v1 (client_id, currency_id, product_id, sector_id, coupon_type_id, reference_rate_id, is_synthetic, is_deleted, timestamp);
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20220805154421_Init') THEN
    CREATE INDEX "IX_pricing_data_v1_client_id_submission_id_worksheet_id_pricin~" ON pricing_data_v1 (client_id, submission_id, worksheet_id, pricing_table_line_id, timestamp);
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20220805154421_Init') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20220805154421_Init', '6.0.7');
    END IF;
END $EF$;
COMMIT;