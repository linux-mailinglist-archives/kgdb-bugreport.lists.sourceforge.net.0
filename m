Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AFD7E468A
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  7 Nov 2023 18:07:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1r0PXu-0002bi-Rd
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 07 Nov 2023 17:07:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yuran.pereira@hotmail.com>) id 1qzXsG-0006bW-7Z
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 05 Nov 2023 07:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ie0ZVXDVNlkfX5PeUREiXs2GJNaMdWdi8ek50QVOgoA=; b=gHRU65KmlXhzSlJpasFK5oXsyf
 18iVUmfIUwYaHxs1kFZX3fkAKe+o79enNN0s32DZ3vE1SkTwCbYg8i7lDHBzmnN9UdY7sybVWCgE2
 rV5EYq6ybvDjXk/ohmVu3f4gwE+F8MiiwHayhaL2xhOplYt8boljo1HdGTTjfiWjLctc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ie0ZVXDVNlkfX5PeUREiXs2GJNaMdWdi8ek50QVOgoA=; b=K
 VgvQVodkbEECIekQYrk+Ain7dj3dpDz/7SEm62+hpnm/OeVyji4YjsPAvu/rkkknmexJh8bJA3ALJ
 f+cr6ZLu7IUdGZx94HeFeQ60Ss7YxHj0nv7gG7JalBVnEFYmb9wrisgf5unKvkdyNi5UVDkAz1WK8
 52Fp4B51rmKHlI8Q=;
Received: from mail-vi1eur05olkn2058.outbound.protection.outlook.com
 ([40.92.90.58] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qzXs9-0007Je-20 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 05 Nov 2023 07:48:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ja7BVKBgUhF8Zh90itUbd2XBuFS3QUiUowEfyuW7jJrMEhY04d5YzPZtB9+IV00RK6SDpfxN9NjuFUALId6hou+sADik435YjSs8H1vVMPjJW68xNQ/NGBArSzslpGTXDGDLF49lRIGaVPPsgbJiIjHX8/xHk5ZsP3gfbN8FJR0XgztkEJOGl7ABOz0xK+PhGhXyLY2Bixb6TD2Llvee8LovGDKFFza4DMNOOs68QREUh8TRiURubYsC50/0pvy/uvh5FZcNyzILLamLc3Ey8UMbT/mEA0Tx2oZRPGd4YtuXQ6h1xfsGPiLk7UhijpvBfNFKxoKEIEAtJPNgFPgXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ie0ZVXDVNlkfX5PeUREiXs2GJNaMdWdi8ek50QVOgoA=;
 b=VY9rFXRhiDCFnjjF4NZ6ZUX4lACLeaevfw9rs1Y0jpSrvik7B7Gufd7mbqIE2tJ1ywE+O7J2dLql1Mx7W4WgXcVvrdA3PfgCqWGElPYsaxVKUSI+nrFFgYbWaJ7d494oFtSNQJF3w06OYzGxwKp7FnlxNbEo8Ve+JG+ovidftM0o/cSmqJXQssCuDWDUvA9u8QVY2VqcnthYADCJ3SAmkX3bazhgEFCP3d4a6i44nC7B4ab6sqjeaDJ2M5avUxtytkcw4pGN9J6a404bxIKgT3BHFRtFKChq7fjO/vGdPAd3dt9hDvZKW9w218KnlRvfKy8aPRiE0DUny/LTcsmR0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ie0ZVXDVNlkfX5PeUREiXs2GJNaMdWdi8ek50QVOgoA=;
 b=crOON4a6XPuQX6O6TNrotaUQHwBnm1JLyLKSUUod+JFUsbC1kzooD53iVDHo85kH4AAECHBND9bE42XLXtl7koguR84Z7exsZHgu7x0lVoLGGs88dVfViVm3LFL8kQoTV5a9SJFk5iDe1IsLJTA5CfNPhbNztOQbhoqlDtAcqTTjKPXoS2EHds5CxbXCwbmkpuGTwfkAfb5URg02JsR3wagc4sOGbAF2eyNlJ7kbik/6V4D9nP8dC2uubEipDvdMI8zxQeZoEXA1A0HwBYMErU3ubmBLLUss+8lIE5l5xs2k6LzDc3jTTmQ00fsG/iwZWaXU0KqlevcC1D/mntN9hQ==
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:42a::7)
 by VE1PR10MB3808.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:160::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Sun, 5 Nov
 2023 07:48:31 +0000
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97]) by DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97%7]) with mapi id 15.20.6954.027; Sun, 5 Nov 2023
 07:48:31 +0000
From: Yuran Pereira <yuran.pereira@hotmail.com>
To: kgdb-bugreport@lists.sourceforge.net
Date: Sun,  5 Nov 2023 13:18:08 +0530
Message-ID: <DB3PR10MB6835B383B596133EDECEA98AE8ABA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
X-TMN: [iqloYnYSmAahuE+0adb40GIywgtCzLXG]
X-ClientProxiedBy: JNAP275CA0064.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::20)
 To DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:42a::7)
X-Microsoft-Original-Message-ID: <20231105074808.1715645-1-yuran.pereira@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR10MB6835:EE_|VE1PR10MB3808:EE_
X-MS-Office365-Filtering-Correlation-Id: 47881ade-bdeb-4577-dcfe-08dbddd39a27
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ihbH3rQVLn/WyOwcJCLF3Gfq9po2GeNqtx8TlFkE+r68Ghwl/cl/zPQgijSJe0U7x/7XmkGAnXtmuyImEqzSvyqIx1NDMFNElScc10rmZa+TqUU4jSt/OKENLXzs8rZ/Fm+1bEUNdAWL4BTR00iacYK7mC6O4GVlNqdwXdP+E0V/iA7YkfPSG3Ld9VzcQL432XVEF7bd5HzVtkxEGGZeDXCbv5qv8UPOFYQ6OSa/m2xghngwUKbvU2oCQ1rg61vL7khOHq6T2Nt3bsKe6OtfG3vBVMtINl2IHFFKayFTBeXnRRs8crm73YAD/y26Q4u2/SbBCbpiz1judv/8luFBPGf1n9uCXrpO4nmTgrj/LXFmOmfS60yDBSlzxBB9yBtH/FKztOd4jljyFENwjcCLfdRA20cV38O5e4AkF4CD4HpbUmAKKWc7tYsqQHL6qdEwiyXi62jEpX4oBXRLCLh2Bl/r6upyXZEOSsHZZlIBdzBbD8PZDj3mnKmExIqc6MAixIVywr6mMSxIpIx64DXxwgb+Ibx5n9GqukEJLz7X/4+fxQ8js0LWrlET9vnu/6D6rg0JDrzhFY1c3bEp4491wcvZf4Djp6fVtKQ6jISIZPIAE4BJ75JmI9axHhxUMKjP
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qoVwU08jxhvxKriMJz2yXbBI0lomWLkGnOaJxABoO9rEU4hpNUFfiGVMUxTP?=
 =?us-ascii?Q?+wKLqqhQDnGsvH++oqcih7jycj6g9ygGmnfJ1rSkg3/SQxOb0Wi/agmezHW7?=
 =?us-ascii?Q?mWWmvLyRE+vwjcRDBMjX9b5mj6hKUKzpknJlSP7aiILd86FCsUIu2ZdXkRJX?=
 =?us-ascii?Q?MJH9xs0fmYfdg1G2P/6yhLSYzqrk/v1C4R9duuu3SvIpS6Dflp9Bkh+88s0Q?=
 =?us-ascii?Q?bMPdpZbzPeziRmZCZv1VCLBjxFtpbsC7HWZrjdaSh1Sr91txD4p+uLfzuEnJ?=
 =?us-ascii?Q?eOe0r+2AdpvjZTIhy1x0l+zBj4evQ1HaUX5BX/NGlNkRFU9RtTHtQZt/6Ldn?=
 =?us-ascii?Q?bXpuyBZGzPBUlr4dVB6ca7QeVfdkrqNqe8Dz74IpTAMTc0PfUkzT03qUQae7?=
 =?us-ascii?Q?wRfd4DWJGLONV/ZuVlMxtYbwQq464AOJyZr4eUWt5UawL7t0Bd98gl5ZY/jN?=
 =?us-ascii?Q?/9HTLvq7vym2YwLn3DeE07++MX6x4X2+BAs2NLnN5arUdpEKoE4QyHItOQJQ?=
 =?us-ascii?Q?yMYPPL/25OdZBsPkv8pXsUo2HsIaxDk2XMe75JspiAz7e/lSbwppNhnbZAlq?=
 =?us-ascii?Q?lUuE9gtnNCHu4tYPiG4WZ/lS7zdt8njXMuItkXuL+KkYm0zxq49Gy4TqiUlE?=
 =?us-ascii?Q?BbT8uz0Bsp6Ct+g18KbPang1TxODcQNPt3Qh9z1rqqvVJYkW4chDPR4BRc/p?=
 =?us-ascii?Q?tpIYU7i637pcdnXTbSJZx2nYsBnItxurqLe3y9ldK1A7ObQkzkoWS6Q9Wzgy?=
 =?us-ascii?Q?/AO7hL8ynLzrbbfVsxa52X3hNLNCpyysddA4ExMQVcMmZWBAXUj9Y/RtBU7F?=
 =?us-ascii?Q?KdpfQOtLDZwKYN+UUnuENn7xBOXKKDMerhOrz9278TJ9B1w0oRwBAq+00wTs?=
 =?us-ascii?Q?JLaoBo/Il4wuQjgq7VVEuz2ob+TH/WAyLMTfmRwuv6DODNpOM4TLny1KD1jz?=
 =?us-ascii?Q?kkYR7MKHIhxKZei1GVVzSCLec/ohqxgao8RMGc8p+AKUKzE0xeX0DCpCHUZ5?=
 =?us-ascii?Q?gN6osquZM2XJYP09072U7MeH84vGChmES25gxHSOTMRaOSFCmICp9e8KK9Xq?=
 =?us-ascii?Q?GhCxZj05Z73+jEdtrDSNbN9HiJhxSQHzNsNt0FkzJRxIUPRbF1tRKzUl6xM+?=
 =?us-ascii?Q?xNgJFCRQk2esTvHITp6pkTZRIEYS70IFeohoS6HbbVUkH2sN8abbrVohmA7O?=
 =?us-ascii?Q?DsBekjt4DVS5gBKyJrKE2+g4WADV1A3/UGqk2HgNtNfaKyVLAhmSJpHUv78?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 47881ade-bdeb-4577-dcfe-08dbddd39a27
X-MS-Exchange-CrossTenant-AuthSource: DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2023 07:48:31.2994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3808
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch corrects the comment for the kdballocenv function.
 The previous comment incorrectly described the function's parameters and
 return values. Signed-off-by: Yuran Pereira --- kernel/debug/kdb/kdb_main.c
 | 9 +++++---- 1 file changed, 5 insertions(+), 4 deletions(-) 
 Content analysis details:   (1.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.92.90.58 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.92.90.58 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [yuran.pereira[at]hotmail.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 1.2 FORGED_HOTMAIL_RCVD2   hotmail.com 'From' address, but no
 'Received:'
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qzXs9-0007Je-20
X-Mailman-Approved-At: Tue, 07 Nov 2023 17:07:19 +0000
Subject: [Kgdb-bugreport] [PATCH] kdb: Corrects comment for kdballocenv
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
Cc: daniel.thompson@linaro.org, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com, Yuran Pereira <yuran.pereira@hotmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This patch corrects the comment for the kdballocenv function.
The previous comment incorrectly described the function's
parameters and return values.

Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
---
 kernel/debug/kdb/kdb_main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 438b868cbfa9..1aab8a05a145 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -272,11 +272,12 @@ char *kdbgetenv(const char *match)
  * kdballocenv - This function is used to allocate bytes for
  *	environment entries.
  * Parameters:
- *	match	A character string representing a numeric value
- * Outputs:
- *	*value  the unsigned long representation of the env variable 'match'
+ *	bytes	The number of bytes to allocate in the static buffer.
+ *
  * Returns:
- *	Zero on success, a kdb diagnostic on failure.
+ *   A pointer to the allocated space in the buffer on success.
+ *   NULL if bytes > size available in the envbuffer.
+ *
  * Remarks:
  *	We use a static environment buffer (envbuffer) to hold the values
  *	of dynamically generated environment variables (see kdb_set).  Buffer
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
