Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 555E497964A
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 15 Sep 2024 12:17:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1spmJp-0007aR-D4
	for lists+kgdb-bugreport@lfdr.de;
	Sun, 15 Sep 2024 10:17:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <changhuang.liang@starfivetech.com>)
 id 1spN3h-0002MI-Li for kgdb-bugreport@lists.sourceforge.net;
 Sat, 14 Sep 2024 07:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vSxLiTUURtcy50pZGnqkVxPloTuH+xHAc0uVezjfdOc=; b=bpoZzlI3vBd+0x2RjRpMue6f+f
 RLApQh4ntj0qN8adBjK+u7kkLUamanJqvo2JaFLodRXRZv2oPY+9wNvH9m7FZjKVlHFhn1sDQcwYT
 Py6j7lIhnhzTNZqj5IP7sqhxIgeT1XgmKPlareUvr6DKWtINX4U45lxF4h25pOJinmNk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vSxLiTUURtcy50pZGnqkVxPloTuH+xHAc0uVezjfdOc=; b=H
 pXQiJOa/RrJNzq1ldfgMzH+KLi5Hm8HPpK2QRQjZ+0R3pWRonZf3mDNySiO2fAYfEj2T9Ec0eEKqd
 1AXAvLBk9sQG/tvklNGh9BE/CHul3KUM9vldei/fkRgusaTpg5PBV10Il1B9/agxlyjJqCU93LaYc
 C2eTUHcT6aWTlwWU=;
Received: from mail-bjschn02on2135.outbound.protection.partner.outlook.cn
 ([139.219.17.135] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1spN3g-0004YA-2Q for kgdb-bugreport@lists.sourceforge.net;
 Sat, 14 Sep 2024 07:19:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0I/99MZ16AZWXhSHdFQeUqm8nHm/6rRSwGTmJqoWWDwjkAS+pRDxL8HsodE0WgAaN00vmOd2QQ1flHkBPNEQpljVr3/sSxOGm0zimwfxzvgpV/3pPa2iy+t3PqHRg9S9ioWbn0iNk2OCRBnoPTZczb2s8gmTerjdJ0eyBK4S7OiEvjjiiiMxN27ZtyFjsa55v/dbL65QKS8FLIPrZdj3S8SudbUrJvu3RA8PxYEIJ3HNp45CVNEuSZ/HZnCnnqrBoO+z/0g0Z70+Fw+9kaCaKOCsz4aP8c4qM9WcV1wizLZPavjB98jk8vHxnDTr+z4XiW8hTaSBbFs/N1/nu4xfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSxLiTUURtcy50pZGnqkVxPloTuH+xHAc0uVezjfdOc=;
 b=QcPsxJ46aec4wzpCfBqGoUBF6m6YvQgymTQyfguBMQrzMr4fX3CpzDly452kTLM3p0tfOOjElmEh73wcMWUR5HNot30RomHtmeKxbvrZE7RE/CeRkw+QecjN8yqalXnmGHrqKAFKV7LvTg9Dsk26w1SrsUnLDobZh956cRnN6G5e35Rw1QyxRVF4UEj8DNUt5XE/s9HauRyJPYtmD0RJK+sb7p801973DnlzOt7gLx/wLCCMNjvJQnm8PwYDfRmVczmmEq999LfW1yjTIVzu2Sl08MchrKIstuPXZtSBVi+rGz0jNeDVDhBYeisZA+oGgu6MaTlTWHaWIDSCB0TkOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1301.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.21; Sat, 14 Sep
 2024 07:03:08 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%5])
 with mapi id 15.20.7962.021; Sat, 14 Sep 2024 07:03:08 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Sat, 14 Sep 2024 00:03:00 -0700
Message-Id: <20240914070300.42936-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: ZQ0PR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::9) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1301:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fd1ccd1-24f2-43da-926d-08dcd48b498b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|41320700013|1800799024|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: C1tEnaS+Gn78YYxaA5Do0eLkoZqTM73RAH7OVP/mYDh+knrYhTyjAB07eJra22CiFovNNqIC3keQZ98wYh7AQsYBlstr64rZv5p5AIEq5AB8T733ZGjr+3NujCeHPb9DtkKUMWv7toI+cKNnLpPexFwJfUohtgcbHqV17H++7ZGFOXbIfYdNzM4y11lrGisAUoR/b4kuNVKH5W9ADBpqRMkusVKQkhlYjpru9aEyFXB87jSq3RSXM36Q6LS/6W3yzEMEflGblfZRRG6p23pqrwirmR4UKR74ixRp/mRTFMS7VCVMqEIy9xUdQp9PbMxyEsFFRtPcJdjGXWRWojNs196qCws7UmT2EQ0FTnNJiC0XbqZFxe4HRSa3SMW3iORPJWiI1FmUXe1dhalBK2Fz+74+zIpCptPgn1NOcPq0v5N9COk3LBMui3BPRX5qTQTzNA8ffqCAIFSngufbHFXKCa+4zsJNHvcTX2MceDqKILpDihkbQv2Ow82qLf0WZa6FP8zuhFNNz5BgrVRie1WbZ2KyBcCQG/mdV5MJqkRtCLVLoKzIiRD5ugrvizZNzi/5F3ucD2LfYk00PalUkI2fpbFF40paClOFxeGSkbwnyWUAadTp3kQ/iU8RREAUnQc1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(41320700013)(1800799024)(52116014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pD27BJyFd3X5C95AU1PZPP/ZMrVBe8NW0JpKm+FkXO06P8Dda4yHNW1DCAdy?=
 =?us-ascii?Q?k5XKdHpthSgtuzfmCHQAA+C4tYrqgleySsTYuW+TrKb7rlPxiYU31dY/z7wv?=
 =?us-ascii?Q?5FunuRf+LJy+MmZBMUsbAFHREFPfn2grbDbEbRgLhyVghaf0gBW/6ZnR+Nkf?=
 =?us-ascii?Q?bdwDDkbXcb/HjUvOVp7cxlKNbrMDcyoFvdsHKj6V0s05Q05aAw9BeazOK0iW?=
 =?us-ascii?Q?4JhQjBqtChQF/gJE3Oy9f6Gy+Sz2gZ/qjfCJaQY1n0Ut2GjKMhu5Y15kM7qc?=
 =?us-ascii?Q?rK7MGmquzcaYQaUEcefjZhFJ6hSYpGrGH+LSrtSSMwX5g2bf2eDOIwhqM59C?=
 =?us-ascii?Q?9C259Ygu2CNw92B6FfpLQp1iGA/JOjd2HqsWoLI6N2FAPPVI4xHPeit++5tY?=
 =?us-ascii?Q?uZlX3OeTCOId59GBCxWneNU5FSD/fQdgNEFnFfYA4ZSBqWIa7W0oLTtXp1dt?=
 =?us-ascii?Q?2nEFWFaDZLIgGPG77FFJ41EH3XypdydiE5NtrGasxn09cyIkhyKu9bYH18+5?=
 =?us-ascii?Q?4a42S8H1ok4PNEi68mHqh37HzcORoEMTTPKQEuUv72PDIgPOJ7XZUZ1qeoZ5?=
 =?us-ascii?Q?9SWMxcbdqonLV4Jg+4M10ck1ZUF/3y7aYcIEKlgW2Ixuqk52BCm+kzBogRBV?=
 =?us-ascii?Q?tCTJQ4ayLZwyZg4ZdHz3MArZipSqu9df0ZJRdivynqSOQ6Vg9wcXd55UA1nK?=
 =?us-ascii?Q?csyyxLtqHZDRNCK968qoVMhoCUVzUGQxqkEypUwTKBJVnwsLr/JVbfYlu0i+?=
 =?us-ascii?Q?5GO2pSgPjo34aht0dvT0WDr0xLCxPOmM7a5Q4alNHd4uFarsxBz+jEe8TK6h?=
 =?us-ascii?Q?VnRVhNwzGh1d4fM0oiBKu4X0QYz+3ut1AmCeiYQGk30/i1gUg4XAEzAzji34?=
 =?us-ascii?Q?GdwZfMAdU/24nOpJTtL520bsg8TkZNYP4dgLF0rCu3XwzN4Vl3//ktY7KzTN?=
 =?us-ascii?Q?nchYGvlPIwEs1V4f3YW2Z0dz0lh5UucVl3qHbH4ZEYbbYfalxWIE9bZopLpV?=
 =?us-ascii?Q?Rg9GbmTll7nBJEkNIJDQRp+3s4B3u2eyCnCvUSBnddJteoBc3fwp3rwWSFE/?=
 =?us-ascii?Q?ExQG1QJg/UqfseyRFKyv7ON49ht3/1eZkWn4j5GiB5dqcueb8T1UpVVU5gvS?=
 =?us-ascii?Q?1+y7fBZjCRufEwZROqsS39/BmUqLUshPv8e6euAEGFL0FIY5rHFZZU/UDto5?=
 =?us-ascii?Q?xHJrybPd5fepr6mQru8GeqEzo7IzoPxzHOFmcAtGuPn4ZdAc7r0QSES06ZNQ?=
 =?us-ascii?Q?OcskdoVYSFqsiC+EDJdh75I5Hvrbew0ICPnDsrTnBgz4EfpfRMmI6d26rHEP?=
 =?us-ascii?Q?vlJBVyFYrkwD+AB8A+/+ik9z1OGLZV2Squs6cZAIzZmvw04K4uER6lglcBEP?=
 =?us-ascii?Q?woTMQt/G0uD6wenG9fefjMT8CBAhloW2lsBYrgSd/s1872g+5t4qj2us8Dmi?=
 =?us-ascii?Q?fk1DRC/gfWfVsi/0sv8PzkIY8do9hEy37HM+L5caupQ9i5NoBbhKlr9ajezo?=
 =?us-ascii?Q?K6L13b+OZTxMk8DAb27Z58GSNqE5Vyxk/m5eOQvHrlAUIJa0z+hlKHHphAge?=
 =?us-ascii?Q?LTwt05U0igUEGydUREBCjWSRcCOoQyTLZLoCf8LX28MvLPmCutgB0jMlJJYg?=
 =?us-ascii?Q?5m82US0BSjdAm4aKaTyFYtk=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd1ccd1-24f2-43da-926d-08dcd48b498b
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 07:03:08.0632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdGLjrBFjQfc5AVXDqvBV5PTgSklkQ+GZZwzL/yD0+mkXSdhGBjB3FmqNls7RUYKVHSLbmQo3+dPjJOX26oqhfqPBvynNZwt/GT0KScaoy2bYEd7r4ruaEAeIGz2OKCs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1301
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Module kgdb had been converted to debug_core since commit
 c433820971ff ("Move kernel/kgdb.c to kernel/debug/debug_core.c") be added,
 so let's correct the module parameter path. Signed-off-by: Changhuang Liang
 <changhuang.liang@starfivetech.com> --- Documentation/dev-tools/kgdb.rst
 | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-Headers-End: 1spN3g-0004YA-2Q
X-Mailman-Approved-At: Sun, 15 Sep 2024 10:17:23 +0000
Subject: [Kgdb-bugreport] [v1] Documentation: kgdb: Correct parameter error
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

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
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
