Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B50B2497CA3
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 24 Jan 2022 11:02:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nBwBR-0001OS-0m
	for lists+kgdb-bugreport@lfdr.de; Mon, 24 Jan 2022 10:02:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <christophe.leroy@csgroup.eu>) id 1nBvnn-0001u4-NN
 for kgdb-bugreport@lists.sourceforge.net; Mon, 24 Jan 2022 09:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O+CeV327RTVvdEcxdN1wQBsa3h5QC1tyTLvFztvuQB8=; b=F6yfQakN0iPWzZM9h02hoky+rp
 shyx6uVR5Lnd3zWc8RSf6kjoZzRuNV5FJE0Bcj+aQnL/7Fs4bZPMuC2Yj0xNX+x4QyDCbNV99Ssgt
 Yh7UX6KIn4YgZPkeOI79oJobHecRuOd6vl4OSj3lm8S6c6y9OZ2rbKt/Nfi6GytAHcKQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O+CeV327RTVvdEcxdN1wQBsa3h5QC1tyTLvFztvuQB8=; b=GtAsUCDU0k7ZksTp/i5/Nxou9W
 erzry6r97PCcLOfSWWUI7+WTXd3RS3xVFW+Vp9SIM3m61ZvvTNxaSy8BlHLT5x4qTQPyQBFP9waXv
 U6m7z26+NjnU66j4Y171pYJV4WejtzEK1ywwC0EIAskyJdmiyD4w7MMiHzKQnWW4mnA0=;
Received: from mail-eopbgr120083.outbound.protection.outlook.com
 ([40.107.12.83] helo=FRA01-PR2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nBvnk-00ADBm-Mg
 for kgdb-bugreport@lists.sourceforge.net; Mon, 24 Jan 2022 09:38:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkfdG7ScK2vgeI+nYwpg2VXiBDMgmEacARdkET6VhloWM2RhAja5zx/el0Z8/nlQRwOlR6bexTXzfWAGIdVfM8KdjRKUwJgyf2WoBowGx88yQing16Ct72EkmK25x5uOGKnGDk1YxlzH/C6RrnRFDFfQfAcqYNIhmUQ0mMcZ47DxH3MRr+qTfO32AqAjthDr5sM6Y92iVyLqpVDC5tlQagM3ISFwM5l2N8kDhXjWQb7FrJLxEaUWBZrnyp1gMuujkbfUlutDud2fJgBjZfjO6B7SmJrqG5PRotXLQqZKcdUZUzXOVYsuNhnXAbmAGCJm67mlUD1SemEtwvB1nDse8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+CeV327RTVvdEcxdN1wQBsa3h5QC1tyTLvFztvuQB8=;
 b=b0oD3cIW+VQBFXmjkye7BGgssW8TdFYSeylFylmpQ7RdKsaSl2jN/mbHafAq7nyQ3QnDJYMK0r7wJPAiX4iRbuMwMBuvTP4ykRGNJq6Ilaov1IEzJ6xmQkpFkVFKe0QHglNIDzCwpMX9yQ6ZCwAK1/HGKiUz190xKAp2lFp+B8o7V1zfCTxvZje41tyUre1bP8VjJOTSXLJOA5Y3kn1vb3AOmxgIi/7htTuhwuqluPEwOAKGR8ZQ6f9PFyOTIvLq4x5GtFS/J735UAgYc5wVehFhfiS+dXCKMuArj4SweKzYK6WFgXMHBzBylaavNyoj5O6qHot4FyFZt5RZfd6zSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB0235.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Mon, 24 Jan
 2022 09:22:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 09:22:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>
Thread-Topic: [PATCH 2/7] modules: Add within_module_text() macro
Thread-Index: AQHYEQPiNEhZhVr+ok+URNEzXjzsfg==
Date: Mon, 24 Jan 2022 09:22:19 +0000
Message-ID: <0cd6fff65c1038286f62c4207c0d2e90b78c5cd4.1643015752.git.christophe.leroy@csgroup.eu>
References: <cover.1643015752.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1643015752.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f5f4eda-6347-4440-531f-08d9df1b051b
x-ms-traffictypediagnostic: PR0P264MB0235:EE_
x-microsoft-antispam-prvs: <PR0P264MB0235BB93661FFFF790C3BF67ED5E9@PR0P264MB0235.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:227;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PuYgn0K0sn7sTo45g+IdGEvG1NMGl4M5yPkv/hVPMv986AeGGR0QLaa/Jp8K4kuBvbrgEeoxMxa1PGpk7vrea8q3ID9vxjdTcPY1i0gIS/ZKHMHh89Vux7r6Y0+vqE6jVvD7YiYFwHeWSe1vIOy6NNLpsS3vgx5fGNjCuqE9P6f9z+VGe1mMZY59o2soL9xjaLD0r41Xk7/fZfrc8p8NYoG2K6yKImLHuZOcz9oQ1QLlr4xI94vMOEo1ShyMswcqk7VT4YR2u3ORKNbDnK2ljeK8GPWU2a+60qTKFAHJC65O4TrRRmzIE9RIvKKjjS2v4AmCaGWYayLp8OeKSQCrSik9piGP8rctkG2AkPjnCyUUQZPMACxBA3spng1g2vzS5a15M7STRXLI0Tsrlx8+kARB28V3URQ567iNCsnnL1fL+XOUNRpN6YEDWzfin3LFC+BUE3+e5bmEuYGyvMzlvxRI6/h4Emh6weKEwAQ08Ms1WiKbiHCuSLEjtnWLfEzkQBE2MZgfrU2pkRCdXS7GONXyYHgZFrIHD3JrkgXNqkkjP/Zd0xEuW0cMOvttnWGxvtLB5yvYxuu7Ap4tiBUb58F3Ocq3/9lTB7O75AftZbgWx3pXnuGOEPpzwGSu/K3Yk8Sl+1yicrZdCRpMi537j4R4Y3BuYjO+JJVu2jv7J6NmWSdFHIrSRTDxr/LCeGIhUoQzhZ5HMRKqwG7FaVaruA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(6512007)(86362001)(66946007)(2906002)(4326008)(6506007)(66446008)(8676002)(64756008)(71200400001)(44832011)(36756003)(26005)(122000001)(66556008)(508600001)(186003)(66476007)(76116006)(38070700005)(91956017)(54906003)(5660300002)(110136005)(83380400001)(2616005)(6486002)(316002)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1PK7+Cy/9MCi2GmBFGfs17sPHfGi7KoA3Z6F2uyNGi+YWTMGSVNvzbq7G1?=
 =?iso-8859-1?Q?jFQLPFYOpswGT+O6d+P6NtYpd/4k2WviWnMUxTuLDVj/v1RRu4/JeicX14?=
 =?iso-8859-1?Q?RFXNqw0h58+5trMhwJb3X8wiF7T1UYR+FL+IC+8YfWQXLbLcrjDXHiKdAb?=
 =?iso-8859-1?Q?ED7m/KAY2n5FG2924p9KkeOvgHlr8TiUY6Zs7POKOOKz+E3A0b2fMvl4sV?=
 =?iso-8859-1?Q?kB+yekEz/a1/kJCRdF7m8HV32ODrkcJveRhONQEta5ly3QevBxsldj5kch?=
 =?iso-8859-1?Q?9LirxHKWTb7HZdGov6PGqwyxIc4XwnaN8r635RNb9LMryTVAHUlGAOfsCY?=
 =?iso-8859-1?Q?BfnOqHHwJkK27A94uYE25s6R9bsbE3ubDrOvWwk+I3FSqxtW/SHnuzQUUD?=
 =?iso-8859-1?Q?uctZF/BaI72h4nury4hH5ANvZErxwTexlicP1nV0Sox6Vzc3twwYhMBjwZ?=
 =?iso-8859-1?Q?yc1y6ly4N4FQ3Z41C8s9NjKDalzZSrrGZfPuLfLIBfdVZRme8jDbfsyAQ3?=
 =?iso-8859-1?Q?8vg2hFv7QfTAqFMv8gax55G0oGaxrd0DhXPQ+uuNC1KEOkG7EiowGa1Mxs?=
 =?iso-8859-1?Q?eISbNzrFeBxHbTilLOHXSCfI0YXd+V7bXy0Jpya8zcnkR2R/FBYPQlxTgQ?=
 =?iso-8859-1?Q?eXmIO0W1c6pf1ogVazICK5PLGiXJMyat+Nc8z/8kGbY9KisfuqMvzEA0Nb?=
 =?iso-8859-1?Q?nzPcmFCzFVJNMvuc3yhOI/mlu8paO/P0be8XW+FBzqGkjpFz8IldR2+mTV?=
 =?iso-8859-1?Q?F51VRWzCGGU/iNkaCNdc2jYgbJkoXrARaUKLLD/9oCSNdsl/pz54GoLxrH?=
 =?iso-8859-1?Q?5WixF7+jDY6qxofT8WxGIzZKQOXRP+fkkGWfCV+eWGxRbQtq4y47xB/hSo?=
 =?iso-8859-1?Q?WXHxWxh4mPOslTqMXiQYv7uBnzMe5rglluDEnxiXWdoWJyp1DTUHkN4Rlp?=
 =?iso-8859-1?Q?BP4WWxy+On1SPsy2fGt3UfenILn2ZvSwkw/XfCSK+SHKBv3/buIyBPjnZG?=
 =?iso-8859-1?Q?TsPt0VmSbsqwHIEzz3/RYOg7uCz9Ejz3lc/2xFaXHTNfcDNyTkhSv441zb?=
 =?iso-8859-1?Q?wdgiWK6xe7hUsOjAE9iFoF7pDhNcznh/6edg3NNtJKponiMtWUvgAEAhnP?=
 =?iso-8859-1?Q?yIAdyC1Wgi67ZWLpBGEwKkN7IFb6hCdB7JRZcrd+C1YLROb/lYBc5EGJKi?=
 =?iso-8859-1?Q?yF2K4Ji/PDhXJqNrcmDawJxRnzt6xUZ9npok+o1pQSU/lADBxaL7ymSyKN?=
 =?iso-8859-1?Q?mpA9MpM98pVqj6EFLdis6Xm28J0DDrBJhiNl+/dy91tB8pHOKihEMOHQB0?=
 =?iso-8859-1?Q?DzQOr5Tr+uBRzBN7gRSI0Fq77YNs5lvY3U1dfw4sVTBrQudWNBUQnC8log?=
 =?iso-8859-1?Q?1z8eyrkH3FubYyEn9hgrG64iZKp3iZyOmcDICkoYhvGeax9PyQbJmjsmKi?=
 =?iso-8859-1?Q?fx1Sp91/53fiVt1+uDoGrSUUCMYbDc4vZaW1/34Fr2jeHhU29JyVT4U7cV?=
 =?iso-8859-1?Q?7BqG072aje3u+PautkgInKEIRRvVHDFfl625aIr/cgN8svMHSjyQDViHnJ?=
 =?iso-8859-1?Q?PIl7gTRKNJM6dJw4iMKh3rJ30q5U/b0lYf1ejTfg2ZNrwDWNVhFIRyzE2i?=
 =?iso-8859-1?Q?0Rm7dvPDgi1iLCkTP5Xq42Z4uBdu8Xt9U7vu+SA/ryGDmZ1qDXSJPcstO0?=
 =?iso-8859-1?Q?IEpZrLKh+CEfje62Bi0mhpjBCo1FXD+5Rnhr5jcE+AZyiBZjM4SZP4oUdB?=
 =?iso-8859-1?Q?AR93eaBz/EtWEtUmQR3OEuwB4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5f4eda-6347-4440-531f-08d9df1b051b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2022 09:22:19.1642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: le6uaqCbUcrkeXcMDeo4ArJzqgd9kk4SnQ3m1i0I2D2IfJZMPhz1QsSnwNy29xpR48fiyjdbG27ry8LTQE2UowdS58BlVcyUV5HghejseRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB0235
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Add a macro to check whether an address is within module's
 text. Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu> ---
 include/linux/module.h
 | 13 +++++++++++++ kernel/module.c | 17 +++++ 2 files changed, 18 insertions(+),
 12 deletions(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.12.83 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.12.83 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1nBvnk-00ADBm-Mg
X-Mailman-Approved-At: Mon, 24 Jan 2022 10:02:43 +0000
Subject: [Kgdb-bugreport] [PATCH 2/7] modules: Add within_module_text() macro
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

Add a macro to check whether an address is within module's text.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/linux/module.h | 13 +++++++++++++
 kernel/module.c        | 17 +++++------------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 33b4db8f5ca5..fc7adb110a81 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -570,6 +570,19 @@ static inline bool within_range(unsigned long addr, void *base, unsigned int siz
 	return addr >= (unsigned long)base && addr < (unsigned long)base + size;
 }
 
+static inline bool within_module_layout_text(unsigned long addr,
+					     const struct module_layout *layout)
+{
+	return within_range(addr, layout->base, layout->text_size);
+}
+
+static inline bool within_module_text(unsigned long addr,
+				      const struct module *mod)
+{
+	return within_module_layout_text(addr, &mod->core_layout) ||
+	       within_module_layout_text(addr, &mod->init_layout);
+}
+
 static inline bool within_module_layout(unsigned long addr,
 					const struct module_layout *layout)
 {
diff --git a/kernel/module.c b/kernel/module.c
index 84a9141a5e15..201d27643c84 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -4224,11 +4224,6 @@ SYSCALL_DEFINE3(finit_module, int, fd, const char __user *, uargs, int, flags)
 	return load_module(&info, uargs, flags);
 }
 
-static inline int within(unsigned long addr, void *start, unsigned long size)
-{
-	return ((void *)addr >= start && (void *)addr < start + size);
-}
-
 #ifdef CONFIG_KALLSYMS
 /*
  * This ignores the intensely annoying "mapping symbols" found
@@ -4765,13 +4760,11 @@ bool is_module_text_address(unsigned long addr)
 struct module *__module_text_address(unsigned long addr)
 {
 	struct module *mod = __module_address(addr);
-	if (mod) {
-		/* Make sure it's within the text section. */
-		if (!within(addr, mod->init_layout.base, mod->init_layout.text_size)
-		    && !within(addr, mod->core_layout.base, mod->core_layout.text_size))
-			mod = NULL;
-	}
-	return mod;
+
+	if (mod && within_module_text(addr, mod))
+		return mod;
+
+	return NULL;
 }
 
 /* Don't grab lock, we're oopsing. */
-- 
2.33.1


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
