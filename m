Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D522697B69B
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 18 Sep 2024 03:46:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sqjmC-00046l-8K
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 18 Sep 2024 01:46:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <changhuang.liang@starfivetech.com>)
 id 1sqjmB-00046f-JU for kgdb-bugreport@lists.sourceforge.net;
 Wed, 18 Sep 2024 01:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iEzOb6KomuQxBCSKjp70uRdoq+I42OufVzOKORTzk/Y=; b=QmGo4spLzn3qHDIGOouTZHrJRU
 5zBDMRz2C23sl/BAw05k5jouvlt9ajMTZTOMVP7Ec6r6pmJ6yoyNKEGK3n4AFJnvXnzohgOzc14ru
 M/FBJ6d7AS6u51QNBEkS0LCYS5OLV+b5DgXlTcTfIo/Yfz/jj68sXIe0LDubHeXKuPvw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iEzOb6KomuQxBCSKjp70uRdoq+I42OufVzOKORTzk/Y=; b=A
 l4UcvEYD0Jz/oBpNo0DJZZFhSSOnG01zjkMm/xgiyxiY+OP2itB1lh5pM/ENlGUKCyXHEv4ikYcJY
 SEp8y/T3lEkPIvmtWCBIvd8t8fXzbJYuKuwrVofW5siNHxe+SQIgx2r1BK9Ed2dfZdOlxtb/i4dqz
 CkgyYu8VDD0yskLg=;
Received: from mail-bjschn02on2097.outbound.protection.partner.outlook.cn
 ([139.219.17.97] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sqjm8-00019x-DL for kgdb-bugreport@lists.sourceforge.net;
 Wed, 18 Sep 2024 01:46:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrJHeVkDaQUDgQOB/U3jXmy8lS1jZZnW+f7ZiJO/N+/m4BMy/W9f47JCVDtpkmFgZXUuxWThn+CAEheovqblLwqT6L0iUop9IlrOnmz99GIGqovNF1YYAg+31jHgIYa+aG7iV6DHMqC3zVkrkxWY7QjitH8dvbpJD8TGPBAjohDSjmXWI7ElnvetHcWVBd0PkF8jzSYQnYw1jt5mhx6lBWcSjHGzgm5uyYrvORk2IjTfsHrCDbSM2O3276D8U/icRm472LqzMX+oxtw066mloaP/eBoFOMJC2l6N2IJ9o/U1El3ONT8QoQOkMH3MaD2Tm+jMvMQejm42aWUdIB4AzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEzOb6KomuQxBCSKjp70uRdoq+I42OufVzOKORTzk/Y=;
 b=euFAi6TirlgtucgQpEzqXvqUyQcDtxpLHbWxQ8baOGtxReJ5wWplujtEfatEMz24mmuGqQ5Sd7JwwX1D6xpbKW1PAA+6fxmDsu2wMKYoKxNg5kWr6vN1/LBZ3kwUeLiMTJu4/lxQI0ZZZjgyiMZnjNvvJbLm48/2h0uNUBjem9jf+GurF/6mn1n9n9rIhmg8p9Yt8ZhZIBkmQTFtPRHcKOJvIiG3yFEA24AFI+bjewYid+KibuOtSbFgJjY/K8h+aGcIwG0O/f9YXmpvnRyun2nQ8pMUHBS7TkWpB8nYqwhoRJIkzl27T8sUFqAXxviKWbU2/jxJzwZPZk1BIpSr2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB0982.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.20; Wed, 18 Sep
 2024 01:46:26 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%5])
 with mapi id 15.20.7962.022; Wed, 18 Sep 2024 01:46:26 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Tue, 17 Sep 2024 18:46:19 -0700
Message-Id: <20240918014619.1820659-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: NT0PR01CA0014.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::16) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB0982:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d30169e-261b-4ae4-ab96-08dcd783b575
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|41320700013|1800799024|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: vcYyCOPCOcP1DUTZmCS+/2jgp+UgKZu0fRYD9veJoI3CIBzwc85SKvUZbtliFfBaayjoE+wYY2MN+9bP73mW7+f+yx/ztg//HqTfsEwcAlg2pYcaYnVK3ncYcNNxlco6vZ+vvBrP4EQjAuKRYyQrz2vpd28oNshcm5EpyrhkkwWwUuAcvma8BdvNNnsejbcrRuDbWg+FwMWG5AdgnY9dfgHtGdY00H13B47UbpNzlYZYxqdv4A9IyJxe0qWQs06Q9FliDGCFaMHv+KsF9WQzyzinu9SIDCPiwYKFpYAKLuI1gouTbGszPKQww6yDhNrwn176nMQqLXOtbuf96+S/c7AM2owBlvdsTQfoDYggqlS4BENHD+sSp41FkSyVaa7RyPiUmkh4w+WLw8mLx5SnJGZdlBopkdlkpHVb77PukcnPC+CuSMn0ttL3q/JsFdmNtxdCebqmK41YKtJ/aQ+kbXOx5zvDIS1A0odXIBzP1UidrnTVhxSXtsw9z7Ab4bb/lqfzq2BM5m9cVIwW9L6COXwIE+cjiTy25DDIx6d7hn+VN5P5Wa12Dd7HhQuvfkIusyKEz8ft1QKUK6iuiZLRia8mi2HhVp7GwkwMViM0EeOqJHTh6kX3b+dago4NmIYL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(41320700013)(1800799024)(52116014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WGcUHyFseSeoRHLbHTthIrvP4Rl9Tj+60WcpB0PnQLFvmly31CfBEmqMY4xI?=
 =?us-ascii?Q?7SS4IwHfOoHixToyhw/cVDEW1KNO2TdZb/4i3bkkjArFXKQZP8liT3zqcxkq?=
 =?us-ascii?Q?gt05/hgUrDE1LcdT95c6NMviu0t04QeKODEi5Ow0C7v2T9L8tzr9CSjKLByC?=
 =?us-ascii?Q?0Tgwm7cX8C14ywqzLpXcAYtw1SZ9LNaKs2lunZbfQdNJfMre7Y8HFm0MT/rd?=
 =?us-ascii?Q?hBm8lmWiTMaFeYfKmAmJomRkMxhDa9RNYH+HR6S/4Ne5X8DN3WyhhsGqN1dz?=
 =?us-ascii?Q?zPEsRzfIXaRcdocv7c4lvPKN3x6HuP+9wbDZUSpfNJEzURUA7MUf5FItRTiD?=
 =?us-ascii?Q?vcj2gjGGobM5Y/2vlXBBiiDD6GOyXvHrMymO66QbGsZoGF0G24m9xsh+zSKC?=
 =?us-ascii?Q?UIHeDuVAJc/if0JFeC8bnMWFUm5A8bXUq8mcQjCDAp6J4UgKjEYudAlUlN2P?=
 =?us-ascii?Q?zM946v5KUhcSSc0bWc6syWIyoMttX9s35VfjqTP96mGP5TsBvy3+uLOme+At?=
 =?us-ascii?Q?KAN7PYdEBI/cLzQ9f1YGWetWqpWu4LSOxvS3aUTPrnyS88FjGSaCnkI/em0r?=
 =?us-ascii?Q?6uCHh8btjcQezy5BboEWyCKQAa36IMmArDgZDCTL0Ztsaxw8diHscSHqjGjF?=
 =?us-ascii?Q?K/lwjzIS/qLafv3yIpxPojS9ABi/BnawIm1E+X3T7jjAeDNNZA9r8OZDBmAR?=
 =?us-ascii?Q?vVUD0+zW5FmYiNs+Z/ZRFf/OPg1Sg46JxDxfwRScSaP5UvtPpKuVyPunLWnW?=
 =?us-ascii?Q?b4ZScvXvXmILXcuTYxbe7vOgFaX5d6S0/qCzbLJsLvTwXyUlZHcZvPmqYBKN?=
 =?us-ascii?Q?PyJ/QqoULqVkTdUdakhKpraqFCcAD8+qVGWznTsy1DN8YXByH1FTj7NX0gEq?=
 =?us-ascii?Q?c+9pm5HZnv7XFGjvcUSqJuT/q0dsgDbyrurqLVdbjvmmWmnnBZCpwnzU8fqG?=
 =?us-ascii?Q?BZ+TbJhx+uYTAVJmsAGEMRqhiTwYR6agZg/8I/fSOJQcm47/24GomwQWaZpY?=
 =?us-ascii?Q?GalipvKk6g0QxgKqziYOcMP7es76E7zqAUIXXuAbUiXIdo8hMc6aPv0ezetb?=
 =?us-ascii?Q?Oi8YXyu/M7o/mqGrYBGmgDjo0D8Fjbjzi53Rxh7o6uf8yez/0m8UdxoMeW17?=
 =?us-ascii?Q?UKqw0G8N0pD7HJayhrjTmiVbtyfNbIVG43pz/USokwcgaR8RRZ1SwRvW0JFO?=
 =?us-ascii?Q?+MC7SF+MeRFckCifNxd0FkU/+y2HOLzoURCNKdNUhqLBoH7fN7fYQb305ZHJ?=
 =?us-ascii?Q?0Eh6KGezFHULHJeO5t5ZlSE00AJ7dIp6WF+LYSAnYPP8ZLcYh5lWKVy3ium5?=
 =?us-ascii?Q?moAuyo/b2+pLcAZEtSqDdHi1GoNFqnXKhCxe7mAMkfSZWW5a7RqV3XvyVQG9?=
 =?us-ascii?Q?XZ5FqRIfn7qXRUhK6AFcq7/nhbRP6yWM/XslMIBSS7mFZX7HYVVQ10PEJEfh?=
 =?us-ascii?Q?G+DUK2rEIsFDnkQlJ0CIyZDZnIG6Bi93r0KGP6mT9bWhilJFP7yjbySgeUzN?=
 =?us-ascii?Q?Lk5kRdI5BPfGko36rmWoSdMyJzX08X7ri7WeHtXImm1OXZnS7wI6mUPVgK4e?=
 =?us-ascii?Q?OP03t+f/ZLTuK7THMCNmLZzrlsGXNjPqj7Tj5jz0/J9yNTxXso1fQR+pqf4f?=
 =?us-ascii?Q?WRoW4ffIQCu+N8y2QWujGBc=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d30169e-261b-4ae4-ab96-08dcd783b575
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 01:46:26.6606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kz9ULqlD6SKtqiaeZ88FNOAdtxbLOpfEfF5LJwtVYwu1nfunow+zwzZdtgKVaTrnri1aMqMPnDjIcpXmUZyXXsggKDC7q9FXFUCd6iqUTAA+Ol+Bn894LrhWfUeovc4I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0982
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Module kgdb had been converted to debug_core since commit
 c433820971ff ("Move kernel/kgdb.c to kernel/debug/debug_core.c") be added,
 so let's correct the module parameter path. Fixes: c433820971ff ("Move
 kernel/kgdb.c
 to kernel/debug/debug_core.c") Signed-off-by: Changhuang Liang
 <changhuang.liang@starfivetech.com>
 Reviewed-by: Douglas Anderson <dianders@chromium.org> --- 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-Headers-End: 1sqjm8-00019x-DL
Subject: [Kgdb-bugreport] [PATCH v2] Documentation: kgdb: Correct parameter
 error
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
Cc: linux-doc@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Module kgdb had been converted to debug_core since commit c433820971ff
("Move kernel/kgdb.c to kernel/debug/debug_core.c") be added, so let's
correct the module parameter path.

Fixes: c433820971ff ("Move kernel/kgdb.c to kernel/debug/debug_core.c")
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Add "Fixes".

---
---
 Documentation/dev-tools/kgdb.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
index f83ba2601e55..a87a58e6509a 100644
--- a/Documentation/dev-tools/kgdb.rst
+++ b/Documentation/dev-tools/kgdb.rst
@@ -329,7 +329,7 @@ ways to activate this feature.
 
 2. Use sysfs before configuring an I/O driver::
 
-	echo 1 > /sys/module/kgdb/parameters/kgdb_use_con
+	echo 1 > /sys/module/debug_core/parameters/kgdb_use_con
 
 .. note::
 
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
