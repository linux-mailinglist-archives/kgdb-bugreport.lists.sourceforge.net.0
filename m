Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A18F54A30EB
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 29 Jan 2022 18:02:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nDr7a-0001Wj-DY
	for lists+kgdb-bugreport@lfdr.de; Sat, 29 Jan 2022 17:02:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <christophe.leroy@csgroup.eu>) id 1nDr7T-0001WH-Uy
 for kgdb-bugreport@lists.sourceforge.net; Sat, 29 Jan 2022 17:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cSCVxbuJ7b2G/qI76FRabVmCoG6DxICmPOKkKXiqnaE=; b=LHSwXLB1XAO8PJfH/Xwt3fZJTo
 J4u9wjN7VDg3lwS8j6Ym51EQtEPTC2dECPOaiE6gUg0vXZmv41mtqFc6BeV4faQypTrSWyVWfKTwJ
 bjG2J6wMVeffatgYF79BqQF7kP+aBoSDcNEooORL4BQ01BNkbM6m46dcGrNL9CIdYP/w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cSCVxbuJ7b2G/qI76FRabVmCoG6DxICmPOKkKXiqnaE=; b=ZYwyAlPZqvIjg0Qbzghs7oU0wW
 UTtRnA1DSlXR8dYhRLE74B8uowd29R3VjWIOTiQvuCYu+6pXQiNQwHb2i8CFYUEYs/M4p+6P/vtQH
 1rJ2ra2gmtRsOeC8MMLEiKz+9iwE8cI+j7TBlTdIxQrdI/8IB+zP9kT7FLDv+oRN/Mgs=;
Received: from mail-eopbgr90074.outbound.protection.outlook.com ([40.107.9.74]
 helo=FRA01-MR2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nDr7I-003LOB-Gn
 for kgdb-bugreport@lists.sourceforge.net; Sat, 29 Jan 2022 17:02:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kfxnno3faHvx2fwiaznYxZtZy8CTLiUNu2yAfOdgGp1ZUaKP0cJAFCnVw1iOC8WsynOFdMieHkV/0/H/zd0xnHD/2bw9gHpB85GhN30dHZFbkB7Pa6Pq9RQrcWqDYKjnT8h1aF1dFeEviDIybgXfuNe532CwjYeF2yDw2wJ67rtRhM03rbU7oFY2bANDtNagOpok7yfMNZdwL09xsRr02bJhF3TrTbGQf5qv1RG8eeYutNcw88hlC67CIX2i7dZHpkxTs1zluL+bmmiP/oXcIpA+qn658GUTio/4Qbw0HJlO5PM9hZFu/LWM6awNrzLxDSbh6CZm4E5HV5ulCT6lUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSCVxbuJ7b2G/qI76FRabVmCoG6DxICmPOKkKXiqnaE=;
 b=XDFUgHhTCjrG9AaU2ADWqLJQIEuQkV3TiCvYvw0cGnwZlYw1MI0wkNS2pfNDYCU9APmTMX+92FOYL/12vwILKKpCRiDVMu+OT3UcNjxk2841Jy54zpCYeQAZvbx6Fjpa0re4k9fxOScBshC1lene3bIpa1KpM7HaJId5Z7ImKxtBEBAXNx/dRjglnbfEiPnhAEk41VMC3YZvLRyS7Tz/f2UiwoYpI5IOu2FVXIaNMD3ODyWNiprCt+pTlaXtqnZ6n9dKwlSmZ/S9NBhNTKRBH2K7U7+U/S81v0dP/8XIGOkhkfnW3OgyTs7Y+kuWkEb1v1l+GR4/UMUpeCOqq/gp3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2584.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Sat, 29 Jan
 2022 17:02:11 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%6]) with mapi id 15.20.4930.020; Sat, 29 Jan 2022
 17:02:11 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>
Thread-Topic: [PATCH v3 5/6] modules: Remove module_addr_min and
 module_addr_max
Thread-Index: AQHYFTH1Li2/03ycxU6FcE0z+2fkwA==
Date: Sat, 29 Jan 2022 17:02:11 +0000
Message-ID: <344a86345b2ad9ec5ce69775c914e508b789b197.1643475473.git.christophe.leroy@csgroup.eu>
References: <cover.1643475473.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1643475473.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b97d94e-295b-4230-011b-08d9e34917b6
x-ms-traffictypediagnostic: PR0P264MB2584:EE_
x-microsoft-antispam-prvs: <PR0P264MB2584BF5FDF4B95395449ED27ED239@PR0P264MB2584.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:324;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: InQqnK9QVAeF9bJywjERHADoIiE8o2cRxckK/XoQTCMwdVTNe9zrDTyLo/pLwXwcV7FTbVfkPWLCEWgAOgts0E/KMzDIdsAuipa14KbD74ttbIX0ZPq5W/Bq/iLhsuSqTqzWOMnD64rFjnDx5ajFhWQKLeLcNx+7HShWWQBcCEBzO7N3sv1nO486gbC01MmSOC4Os5Y3+rU9z9/GX99lHUc3Skky4Zm/HgDBpvmJctUlVvZOEEs0GQPYhnRNPNHy/49wwx2A92dXbcDqCssxWntB9ZUUYAB5XknjRNEwYvFwTDl6+xs6a9C4R/aXc+F3HdowzFpZ8VmEotHTC90hHDzyfJxVRhi6f0RrI1gH5qXSyf1PDqmb1x18XSd5ko26EWWN2TEdclaEpUeMyA11y58/JuFTlLGOLhD2136LQUQit6YymL3DA3l4Gw9IGgW6fl6qkQ7qTZRwXimAG8DEBCH4ROpsnhLpB4iz4T9oomEbP+KqEC1CXchiSIbNKj9n+uFgvswJX5ZdsFsYgcXw7H+Ex9XLywhvfs8MuRlNADHQIIWnZ94kGYy2CEp/kUc16YGREQ241QV4CYoGDH63itmCyjKpVFzYL+LNxSGRvj/rzfyQqoJ5PeFJDc8jmnj8DVnMi96q8IkQ4eyWSbn0RFmdpfl0APoo8n+hMF7fU9x68d2NNlCVqU5Gbj7XH31BYaGcSPE7+xZK291AMy47Gw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(110136005)(6512007)(2906002)(86362001)(6486002)(508600001)(4326008)(122000001)(38100700002)(91956017)(316002)(76116006)(26005)(64756008)(6506007)(8936002)(186003)(5660300002)(44832011)(66476007)(66556008)(71200400001)(66946007)(8676002)(66446008)(83380400001)(2616005)(36756003)(38070700005)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NOn5/vUngpqkvWl0LLfOalAC82YxB+A+eibdNifl/a6LmzEfI89ZKpAow3?=
 =?iso-8859-1?Q?miBRGIADCuIjAJy2OzWy83ED2Tc9ekvu+fxp+ZXqfhs0FNtwsjtM8TyWFq?=
 =?iso-8859-1?Q?cvyGSZ768gOg6G6KqoniOLed8mRoW3vQABC75JUDIz+/Xpsl7fUqFJ5Mug?=
 =?iso-8859-1?Q?eN7dAjVo+OwQhEZmeW/BB5Q9k3kk+J7FX7n8mTDGKW6Uw3pdyNQ7sKOrLI?=
 =?iso-8859-1?Q?tYcUjDSgbnB9OoRGoWu2RNcqPOpspHAlFM1px8JFGQ0eEQV+Xvs7My2sHC?=
 =?iso-8859-1?Q?BbMc0jZ7l7T6ZgS7CH4Udi+To0EfdZWgoK7ZAtKJJ7P0PXkNDb3WiYQJ49?=
 =?iso-8859-1?Q?Z0QTmydcBwSLS+nroSbZ2P2s4mG+yY3HxTHIjx3e9EVwAZEZlo8aMJ1bho?=
 =?iso-8859-1?Q?PgbRbGm5niEpjmPp4VHgxdrDQeWhLtmnKsgU1MMz1BYYK/h/gZjnFa5jd9?=
 =?iso-8859-1?Q?Majd+ymoV92s13bzp75oHeVoxZO7B0yRns3a+gUJzgxKSkX4m3BlCAWk7I?=
 =?iso-8859-1?Q?41ruKAigYLi8U72N0jTMjI4daPfKN+eHhnCm/21wZDMF++EOzwLJNu58UI?=
 =?iso-8859-1?Q?rKJ+s/WfiJ23viF91JbOG034okZV8HVeEOTSix/1oPhefrpXvydbwwIjAw?=
 =?iso-8859-1?Q?vG3CVckVdgYZR7TeswXD8OpO6KFreZsV5JIZJtwYCrChyfzNERfmouU+Ap?=
 =?iso-8859-1?Q?eifCZ1Y9iXO+I0wUny85BN9ieZUJH9zuCFjdsUIcUs3a2OZ/WOO0dQV7id?=
 =?iso-8859-1?Q?mB01aXELupHgBhJ/ZeCsEFLsxG0czhhKLD6IsZVpwygfUcQrFursULaT9T?=
 =?iso-8859-1?Q?EdUBJ4GmlkBmmVqKa4pzdQ3vI5RA0HEAkM9Cct5vfkY8Y3ML1TcFP4clxJ?=
 =?iso-8859-1?Q?2wiAzh95ldqOI3ctLj4D8BHbjjkVCZ+TWpqTZbFkdKlGl8RL0e3MuDiVjo?=
 =?iso-8859-1?Q?TqG5mJBFnmOhw5TuXgPC4zUTFTyfSCv+W99si+l1LP1qAhYslpgE4auW7f?=
 =?iso-8859-1?Q?G/GAd92U1c00cgrOOauURVekArvAYgSqjb8tFhlxeQa4DhVgdCrJesjxvY?=
 =?iso-8859-1?Q?31eJUAI9j7Cx9gynJnvYJuJdjlRb6BDqz165K7J+Vz0uyKEyPRIuz3ATY0?=
 =?iso-8859-1?Q?UPVlOy41I+raar1pm/lN2bY7Cgy4Ut+dtjJYAsBacKTBUxOMQ9zAnkmZBC?=
 =?iso-8859-1?Q?P+lN2b+0AKI5OY5/K/W1hoTXQWPL7VH6iCgyBTg8Kr9/O279tbRJGpNblV?=
 =?iso-8859-1?Q?JjBEfqccCeg/XNa5Y5lXlcr8JmejN8JEf50qLWmjKvaev3PIed80NWmHmg?=
 =?iso-8859-1?Q?EBoCMwzj62m0//UJi5Aug/CgyQXjU3118Xb4J8KWanERMH8sLjZWY5ukjv?=
 =?iso-8859-1?Q?iKdCne6Y3/Lgh26Y1MsSd+cxDvQIJwCQBKxTqPuCDY/qbNhyQrIIxBbDxk?=
 =?iso-8859-1?Q?yAT7boYb0HKAHgCWKhCp0t2xp4vot7aV0ndZL1VB5+t5L8B014K50TbJjL?=
 =?iso-8859-1?Q?6brXWUxrn6zX0hQfWbG299O5nkDxFJBP596s9hBWi9LYiinr6FfFYoHPvG?=
 =?iso-8859-1?Q?6KXIOcaqSkfx918o+GedYIDK480+bcZ7P95dDjh/TCkzGSoYVSpi9QDz+J?=
 =?iso-8859-1?Q?cFgLCE4D3I8Jks7KcKy8ifNJNdp172PSF1qFgJRb8gGquwf8Gt2i0T1hUi?=
 =?iso-8859-1?Q?CCrQjI4N2SiHOv+okRyV9DtJ5x6o24fnatn0/IM7iNHyvuvRjTP72VLT+6?=
 =?iso-8859-1?Q?R35f5GjomzZww/Ajt3Q3urb6U=3D?=
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b97d94e-295b-4230-011b-08d9e34917b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2022 17:02:11.8932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BHuaWMVkOOayyz0OKKttULsn/RB4/NllPUFVoTG9KNJGl8vpGu+AIKmp8xUV5Q2YnDQQw5kef+QT08zK3nJ8Ti4AqcffDD1HLYF6LlK+iWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2584
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Replace module_addr_min and module_addr_max by
 mod_tree.addr_min
 and mod_tree.addr_max Signed-off-by: Christophe Leroy
 <christophe.leroy@csgroup.eu>
 --- kernel/module.c | 9 +++------ 1 file changed, 3 insertions(+),
 6 deletions(-)
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.9.74 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.9.74 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1nDr7I-003LOB-Gn
Subject: [Kgdb-bugreport] [PATCH v3 5/6] modules: Remove module_addr_min and
 module_addr_max
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Replace module_addr_min and module_addr_max by
mod_tree.addr_min and mod_tree.addr_max

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 kernel/module.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index f3758115ebaa..01fdc9c8a5e2 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -89,7 +89,7 @@
  * Mutex protects:
  * 1) List of modules (also safely readable with preempt_disable),
  * 2) module_use links,
- * 3) module_addr_min/module_addr_max.
+ * 3) mod_tree.addr_min/mod_tree.addr_max.
  * (delete and add uses RCU list operations).
  */
 static DEFINE_MUTEX(module_mutex);
@@ -110,9 +110,6 @@ static struct mod_tree_root {
 	.addr_min = -1UL,
 };
 
-#define module_addr_min mod_tree.addr_min
-#define module_addr_max mod_tree.addr_max
-
 #ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
 static struct mod_tree_root mod_data_tree __cacheline_aligned = {
 	.addr_min = -1UL,
@@ -4611,14 +4608,14 @@ static void cfi_init(struct module *mod)
 		mod->exit = *exit;
 #endif
 
-	cfi_module_add(mod, module_addr_min);
+	cfi_module_add(mod, mod_tree.addr_min);
 #endif
 }
 
 static void cfi_cleanup(struct module *mod)
 {
 #ifdef CONFIG_CFI_CLANG
-	cfi_module_remove(mod, module_addr_min);
+	cfi_module_remove(mod, mod_tree.addr_min);
 #endif
 }
 
-- 
2.33.1


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
