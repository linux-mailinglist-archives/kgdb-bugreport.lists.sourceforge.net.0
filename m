Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2147F09F7
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 20 Nov 2023 01:10:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1r4rrj-0003VG-2d
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 20 Nov 2023 00:10:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yuran.pereira@hotmail.com>) id 1r4rrg-0003V9-B5
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 20 Nov 2023 00:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P4QOcl+PaZFuwDi0ESKom6kyt9j6tcui8KvDKr3F7U4=; b=Phx/UXAFbV/0sr/NT5GbzdtbJj
 Www9DQnDv+VfzKQRke59GK3m8KMNvVSN2+Ldx1r1sTJIgIf9vppZT4i0i9wCYil3ork4vqw/jELi0
 3bidGvC7wDokPIx2aXYsN+iodJvbxHnjHVropxcU6o69FGdEQphLE56HTYOTdTBUC2JI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P4QOcl+PaZFuwDi0ESKom6kyt9j6tcui8KvDKr3F7U4=; b=RqQtOQooORxSiA/LSm9IvzWQ3l
 IAaR6Te71iraaMUmqLqQtLCQ5iGnvHh5cM6UnHtye9Whdnwu3G2qOwjL6VVykox4QQlgcTHNFUqew
 dKTp6QSXN6JK3Lqt+8RVHOVK3a7dHepSsIz0fNe3IWmQBwsuecgLejPswyro045q3j2A=;
Received: from mail-db5eur02olkn2021.outbound.protection.outlook.com
 ([40.92.50.21] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r4rrZ-00AaUu-Kl for kgdb-bugreport@lists.sourceforge.net;
 Mon, 20 Nov 2023 00:10:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKL/4vcWGBLsA8DjJiSyerjTUIAGZR7fB1cKN+axB4WvLXN4fKKDwRaWp7qNks/nVBtXQP31IKpcCzimVP914d0iFccQEVaj/AAr6nmJkxwZ+qGjP2FrquO5jWqYjzGILEhY2BjOfD7ZQr6tWEO5+1V6QRGsg4cnWzUpGe7nc9VrLn6GXPh/zHKjDumSmEjxFACBnQkSJIAfHk8CFE9Y8tlhVcfvtY/mImXoieycjQ04syGoPVojnNK2rRm+nRR7/ltxBr6Fm1+pCqdmq+OYdwjQugpn1jP4ZdfNFJOyVw7siMar5PMnFbpJZ7Qn6kM5NewcxacOaZnfN7MRKy3CHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4QOcl+PaZFuwDi0ESKom6kyt9j6tcui8KvDKr3F7U4=;
 b=nWSnLM8Lkw7VHfNC5zDymVSTD7uJLQgjPZHfBW/lePZHizMF84otwN0E0uozgy8MxMP7Wds8NJC/FagUxj0Nn1yFDTEG0ucDe5WuQI2D/aHtbtnYgvwKcOUi064K/OpVLE5s5lZokAENWEVZTAbyjRmXK61sWkfNEXB5z1c7X3XNTy+uI8dz6RMVxEbdSoLAIp/+rpKNLytKWgtXTqoG95tmKCKG/NBe+Bo+sQ6g4Aj3vZ26f6+vYypitSRo1p7XEKVUf9CWdIGyu8K8ATZ9E7TncYmlOZL5IVCfAR5r7kfqw6G6c5LNPKUriKTR9n/HnJzNnn9k5qyeUY/0DUQsUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4QOcl+PaZFuwDi0ESKom6kyt9j6tcui8KvDKr3F7U4=;
 b=vE8K0F9aiYHuCgHK8fYxZAGXVBS99NS607O5aF0gaDg4TdZaJmVFzYTLz33A2xWx0Z3diJ2+xkJp/2Mcy45usxWoz2+KxDQ6MQcbUyQfkqAISSsROeJ/6MxDwbS+YbfNfJNimbW12FnGsVTmdl4RpCR4r5nxdunLA5VOeKaLDlvNRjH9BjGovArC/H/j8W2pqZ2zZY7Ezbe+7/WppU642dZbq0shKB+rL9mO7vQ21FdfBxq0HAuVfirUdL2CM5NDUUgVD7y82HH4lngQ+l3poV1D3EKSJHtkz88GE2A3cNq5FJKYr2i3it1mGFf62bTmITMxzox5C9tmphC0u678PQ==
Received: from GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:83::20)
 by AS8PR10MB6173.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:54a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 00:09:58 +0000
Received: from GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c45:bfdf:a384:5450]) by GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c45:bfdf:a384:5450%7]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 00:09:58 +0000
From: Yuran Pereira <yuran.pereira@hotmail.com>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-trace-kernel@vger.kernel.org
Date: Mon, 20 Nov 2023 05:39:31 +0530
Message-ID: <GV1PR10MB6563DC208657E86715361E94E8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <GV1PR10MB65635561FB160078C3744B5FE8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
References: <GV1PR10MB65635561FB160078C3744B5FE8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
X-TMN: [WHg10UELG6kZDo+wax9DDRTZrHhq9GOA]
X-ClientProxiedBy: JN2P275CA0016.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::28)
 To GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:83::20)
X-Microsoft-Original-Message-ID: <20231120000931.360749-1-yuran.pereira@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR10MB6563:EE_|AS8PR10MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: 0043e2f8-305c-43e9-eb33-08dbe95d0827
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lXrK6pfk9eMDSXua+6UMg6vLTYb5DgQTL3zbC5fEfj/WwsbRKOrx+o4zv9Vc1cBs7WqvGMXbWVgzpC4/fn9py4nNiCKa437uOk+QaxIuNuWgGp4JTLwAUjIFRBuB5tkK3Z95ffmUmfnJB9UnMzgRWa13H3uJjK1JEL+rO5K9CIiudzyndsR88ytGN4xLAhrLQM1USVW+wvNFz+Gk2jivQSzY4j/qIVtx7tGLTxSSgLkwgaCrP8RbetD4CkzbI9+KMILc9e0d8x8C79gJLmXXoZ6gy67/5+acy2G/QSy/j8JBGKsv99rGQgMWiK17N0M2dzj32wdMibVHIRE4p01pZQb5XL5GhXzcxbuyMQhECKazK1HoEdcem0ES6K+nGIyaAi2Df9K0sFPkZQjem9jQHNGRyRaz5GPOj45lfOYve+ADdPTxhmYmcp+ONEZCmvtnf5fRArvH7n7Cc2HONHx2B44CUKr9d4jBfRbbby0XS1Ny2n6E1fO8seKVwPfxmOlIZ7pxaO6rfINPm4dBN2Mhf23Xk8nLX2W2DKHlxjh1las1iNs5ovBB47MkwvZlAe4m+X8fmciNQQ94T+nFiCuKsAA++5ZMUG6rhhzaSGmRNvtPDJmnCW63j1d03+Ktriyx
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RKP9mj73Pe3+qqs/6VmIFcWml/Ltbgz8XylAS+FPRYI7Eh6UdrtW87mf0hWS?=
 =?us-ascii?Q?d4laJxyLfH+HnM1Gzo3uSeXC9U9OT4Ojgp7JZWNFsnG1MwRis9UDZoczmLXZ?=
 =?us-ascii?Q?wMckyUGwxmrNKn8g0tBwW5TVdr5MHta/RxbdPUX6fxwuz3zGkRQNsqSr/4z+?=
 =?us-ascii?Q?DB6xSBJ4knpX3aTLriUquIkpmTz2GbZigmlWUb60rbfWxwPqPL3454QPZVO6?=
 =?us-ascii?Q?jO6L6v2tlFDb3/D2nfAVLa5lJVFNjpMSgCizf48clG70Evt0xdwWnyAKDk4P?=
 =?us-ascii?Q?a5D8poT7IT0+Kk/rmSjzIkq+BOmFzJXPluscUcl/dTjgn7hOfpieEcK7BpqP?=
 =?us-ascii?Q?lZpfSyLx5RQQ5Gelu+7mdD64oSqaHGVQyG3Livs3sGmCvr26lGojqZtYy8T3?=
 =?us-ascii?Q?6npkZh/jV22lxke+mNahwYD5YKUEqTmaLbUHD5bER2p7mreKQUWSDfO6ZDfq?=
 =?us-ascii?Q?kb1HzNSDrLHNDyrugYqNNCZWIMcOatTyvTNgZPxitj+EGMEXVpfjGkR41krB?=
 =?us-ascii?Q?4ie+7Soig6JYuDLxOP4sBbyENWFGUsP21qDpI5x78ZWhlUz7+tGcaP/25GZK?=
 =?us-ascii?Q?bSMkPHZYJnLVgWfKajkp+3/v6qhwSXLGojji0/FE3TSZt0y/nXRcuOJn/h/P?=
 =?us-ascii?Q?tvl0Xq2G10fSDSnAOeoJO21rx2I791UVxA57ZBB1P8yFBvNG8mZEiV3O6w/K?=
 =?us-ascii?Q?BP3eh4WwILyUpJ5MhGaBc8Cm5ewJDVTvv0f7G6v2kKPzQG00EzLEWUwp8wAz?=
 =?us-ascii?Q?sACkdwvsWv53b47feQ5wf/I1x1zhO5sJMBl29nFTA3fwswy2OahltNEhn344?=
 =?us-ascii?Q?PN04DyuuglvzdTkWZQALg+eZ0BUHjW1poEQGyJFhyhXASO1Mj/ZEszxWQDpE?=
 =?us-ascii?Q?B/ffVsTBFNPj0Oei2wMBRF0dAnVE4zym5CXNq7FnRADLEVwSteUFiUllgune?=
 =?us-ascii?Q?z0yIF7gHSziU4wfvGez2KrLGf3kyml3Z3Y8guZxfV8aLbvmiBwKg+09Gi+pX?=
 =?us-ascii?Q?0FBtA5LP3+LDq2aukBlBdpA8ncTxXA7JRIwu/kr51JUkwdLDHC2QkmsQ0i8R?=
 =?us-ascii?Q?+du7/UvgEpCdRlgC2vuJW5NOstsckF7GbmOPaM0okv1vja9AnurylTjXh9w+?=
 =?us-ascii?Q?ziDBcKUPD9f1SVxsvOykRV7s70N3nPiA3Q0lCEmgv7SMdCnng1OBuMCq94HI?=
 =?us-ascii?Q?ozZyKJty+efsyJ8bTf+kCRS9jSPZ/sV0WwDT0cNcjGmVkWLprTq8SvOotZ8?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0043e2f8-305c-43e9-eb33-08dbe95d0827
X-MS-Exchange-CrossTenant-AuthSource: GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 00:09:58.4302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6173
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The function simple_strtoul performs no error checking in
 scenarios where the input value overflows the intended output variable. This
 results in this function successfully returning, even when the ou [...] 
 Content analysis details:   (1.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.92.50.21 listed in wl.mailspike.net]
 1.2 FORGED_HOTMAIL_RCVD2   hotmail.com 'From' address, but no
 'Received:'
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [yuran.pereira[at]hotmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.92.50.21 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r4rrZ-00AaUu-Kl
Subject: [Kgdb-bugreport] [PATCH 2/2] trace: kdb: Replace simple_strtoul
 with kstrtoul in kdb_ftdump
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
Cc: daniel.thompson@linaro.org, rostedt@goodmis.org,
 linux-kernel@vger.kernel.org, mhiramat@kernel.org, jason.wessel@windriver.com,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The function simple_strtoul performs no error checking in scenarios
where the input value overflows the intended output variable.
This results in this function successfully returning, even when the
output does not match the input string (aka the function returns
successfully even when the result is wrong).

Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
simple_strtoul(), and simple_strtoull() functions explicitly ignore
overflows, which may lead to unexpected results in callers."
Hence, the use of those functions is discouraged.

This patch replaces all uses of the simple_strtoul with the safer
alternatives kstrtoint and kstrtol.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull

Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
---
 kernel/trace/trace_kdb.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/kernel/trace/trace_kdb.c b/kernel/trace/trace_kdb.c
index 59857a1ee44c..3891f885e4a6 100644
--- a/kernel/trace/trace_kdb.c
+++ b/kernel/trace/trace_kdb.c
@@ -96,23 +96,21 @@ static int kdb_ftdump(int argc, const char **argv)
 {
 	int skip_entries = 0;
 	long cpu_file;
-	char *cp;
+	int err;
 	int cnt;
 	int cpu;
 
 	if (argc > 2)
 		return KDB_ARGCOUNT;
 
-	if (argc) {
-		skip_entries = simple_strtol(argv[1], &cp, 0);
-		if (*cp)
+	if (argc)
+		if (kstrtoint(argv[1], 0, &skip_entries))
 			skip_entries = 0;
-	}
 
 	if (argc == 2) {
-		cpu_file = simple_strtol(argv[2], &cp, 0);
-		if (*cp || cpu_file >= NR_CPUS || cpu_file < 0 ||
-		    !cpu_online(cpu_file))
+		err = kstrtol(argv[2], 0, &cpu_file);
+		if (err || cpu_file >= NR_CPUS || cpu_file < 0 ||
+				!cpu_online(cpu_file))
 			return KDB_BADINT;
 	} else {
 		cpu_file = RING_BUFFER_ALL_CPUS;
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
