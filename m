Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF4949E0C9
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 27 Jan 2022 12:28:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nD2wk-0005rN-07
	for lists+kgdb-bugreport@lfdr.de; Thu, 27 Jan 2022 11:28:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <christophe.leroy@csgroup.eu>) id 1nD2wh-0005qv-4Q
 for kgdb-bugreport@lists.sourceforge.net; Thu, 27 Jan 2022 11:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qo/dSWpZJ4eG/DcYrkyN0wGp1TZTlfTMGe7iReDPThc=; b=P4fHL4mDzRtUArSH3U2kt3SIkm
 pRUS83Kb/2qd4UABOnVSQQP79ZtKEe2zGDtt/B1NpAFBeAI5I+L+UJUJ4kf10coCln/uL/koOwwer
 /5Lm5sXh4gRY5C93ne3uim/CvhJZ8Qn5Y4jKALj0NFEIkE1IX46GdOn1SbNx+cO/+bY0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qo/dSWpZJ4eG/DcYrkyN0wGp1TZTlfTMGe7iReDPThc=; b=D
 D18f0VxfdLKx2vKSlQv4OKL3Ax+Du8jmQu6ZmI4OuwQtpYDWWpf6ohsC/Falo6/Yxu1oDkkPECYYI
 dC5eiHqHBjOB4ilRAKA8g4uQ2hv/cWuXo3UxMecT8tw5XKrt3YBWdyT2aPux9joC5MoEgfGErgolk
 iXNdV07GjG/nXtYU=;
Received: from mail-eopbgr90083.outbound.protection.outlook.com ([40.107.9.83]
 helo=FRA01-MR2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nD2wd-0006y6-ON
 for kgdb-bugreport@lists.sourceforge.net; Thu, 27 Jan 2022 11:28:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaN+ovFy4/Kdk2donS+euvj/0P9JQtPk1Izi4SOTtgYN4C9m+I2rB3FlUOZoRH2C0k8rs5XizGDGzs3rUwU+zcZnvjeVq+ruwuXoZ7cAAOp58nPM75OZBGfrx/fZnG+O0OTUzztyZdxEVJhCHwS90S4RVclQx0Rj/YXAufuKHiq/iMAvta8PwWrgbW+b5+cYTm/JMs49NZ+0dZRgbHnW7sZ91HZxvMz4E5C2Ghla5h8Q2EREujHghsXNiObMbPr1l0YpIetoVRSdb3gC5HBtAMCBKGvV56FkVRITzW05ptc7gFhlzYeWzoevMA0tGePYIDIGWb0CK4o3UohTpnDRQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qo/dSWpZJ4eG/DcYrkyN0wGp1TZTlfTMGe7iReDPThc=;
 b=cyeJbl/87wl4biAg5LWws3Ow7I9h4lXiHrHsGAiEznY718FVqj6bPI5h5fbfMGHvKgXsoNwx6pANO1U71dThLxfFW7KuDcxe4bCCvVrQxjLi3P1lPnKAjJE0RJmYXFRm/29QOZPyzI35pt+cCdnSEKppUW4M6kZ00r/aHZHn7PDT5EBVlgXB3/JjFhp6e4klbV7L0ONIuN1nB6eCbkPTz0gvKvbgkG2SKP9Hwr562VATgZSrQ2jlawkAfXWCFMgJmU7YorEa8nOHQR2+H/4Yf+uSvb87bUAKzZF1GSGxQjxcKAx76bDMDRRq6lpA0JEDb1y/NUwBaeHP4EpXaIXtRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3227.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:30::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 11:27:56 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%6]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 11:27:56 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>
Thread-Topic: [PATCH v2 0/5] Allocate module text and data separately
Thread-Index: AQHYE3Du95G6zDF79UWzRpf5PWe+tA==
Date: Thu, 27 Jan 2022 11:27:56 +0000
Message-ID: <cover.1643282353.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aaf3ef3f-627e-4b8c-e8cd-08d9e18810d3
x-ms-traffictypediagnostic: MRZP264MB3227:EE_
x-microsoft-antispam-prvs: <MRZP264MB3227CA7CB00F4E3A227EB032ED219@MRZP264MB3227.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7BpsmAyOppkEikge4w+Pv0k46Oc8pfqQSU2EC5Tq8WA50kF0li49hamn9Jnc75/bRAMhOIzf8eJnRKgBpSVD3oHddd+O1EYw1sRq9VpuYtdD5ninoJN1j0ywwWsuaQKBM0YjWOoBb1WtW4IezkYuJ1Ph1fsQVjRUnRMlcRzYKbJafaobYy58AMEfS51ed2JjIWr2jUZrnxOUpC8MNtAhPJEOW/C0rO6WIfDExhbZYquUJJmYnt5lCqIH+ik1qDm6AAs9Dusn2XQF8GJvc4axLgpemCXx5BmQAm6n00wxAURTF22JQWKbhLNn7d0Rv18ejcb12/3B9CntBm9aQ3krDbJtA5y1SbqAiKd+ii04vwphHzzMPICk/uYi5G9lS8ruGPUMXHwWQUdaBT263jywYOoZN/CWRvOaSAcb/qtK2V08nTmIvUTRwHWU59oEMa8tfbgdpLKz2RCU+Ho0wglEOb3z8N4I3GBD3bzSTk0hkF+SDb4yweOQLCZ7wIkZGFUX19gxJ+fBItWaquxxUlXz2sz2NoNXNqwbj2CKuw7oa6FzNjTLnH9uYKbjUTXdXJO470PY8GlR3HJDUnjA9AQHSar0jMvFlAfVMZ5ptaMT2pAcPj4ZM3O3Dev2SRFdQuLSAXpu6ds4ObD48U+eS+nLIX4mV3q7dKSjcNMBxsL59bccJJpajjTrUsy1g3LdYAjmtc0GxSdpxNJehIVa+7wSuQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(316002)(66946007)(6506007)(6512007)(76116006)(508600001)(66476007)(5660300002)(66446008)(66556008)(91956017)(44832011)(4326008)(64756008)(8936002)(8676002)(2616005)(36756003)(6486002)(71200400001)(38070700005)(2906002)(83380400001)(122000001)(26005)(186003)(38100700002)(110136005)(54906003)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?H8LFrhnHSf+SpTNKNOrkfJdpav10Mbs7tNkpjTqnualOq+GRg3vE63BbPq?=
 =?iso-8859-1?Q?pRU4zaFufHtE8KllHgbe9vCaL1co4V0sfebrLTSa+Nnc1AIvot5HO/3Kay?=
 =?iso-8859-1?Q?r52aZTDiZpMdKPfEk7OrkHb34Fc/YPLO18oCNjpzNa5AYOXg1GufwD16Hf?=
 =?iso-8859-1?Q?4lRp1Pkda+d0GqzX3I+6mJFHvUJQr+YbZkmhUpKY1p8upo+/Te3cSw6P11?=
 =?iso-8859-1?Q?fugm8z/U831oFRsZgMw6wcKFGvzx+p6tJTMrChhu4HdjDVJOoQnZIWVGDM?=
 =?iso-8859-1?Q?8+46YeJfoAiXWy+YfAYffzRPFOTlgueVrPgcHQoFnEic37RaXZ26/V1lxP?=
 =?iso-8859-1?Q?VMof1QMr+66AGGST0NIicuq8wx65/uEoWXnD+8/Tun00n93Hg3g+XTNHiP?=
 =?iso-8859-1?Q?CYcnujsp4fZMtxP1gjpsUYM99jnFaq3WZrfFQXPRYHR5CjdGVGCQBlROg5?=
 =?iso-8859-1?Q?Qf0AAxDIcq6fCwRW+nZqvmmWoPvgytGhiQQjPbAIo5TcdSxyrlgwI3nQ/T?=
 =?iso-8859-1?Q?ckpdFmi7Qbqd1vGm9rUIi1X2IsP96n4Ydi9zZeOKmZE7BceD2dpdjVnfja?=
 =?iso-8859-1?Q?w1Iwy/wD+Dy3jncdEXK/Et3R6aJm3MHNVhvo3x9nQPqlWFqkzTmTW+ioPq?=
 =?iso-8859-1?Q?2YIYC1ktplK3nwBlSzOkHSggosbKkMRRXWPx/xEdzg9kfLLXcp51EJN9Io?=
 =?iso-8859-1?Q?Ro9E9KKvlUG4Ei3VsiW74VnJh/PLHu0/atBxpjymCRWqtxM5m/N5QgrfxP?=
 =?iso-8859-1?Q?XuLrQALEOwv2l+x25KumRIHkmeb0EbiNjNzWgIkbJaiMWY7ijfIjiafcF7?=
 =?iso-8859-1?Q?pq7u2aE8A20VaALOf+37wli0Uqld41SJ4gFGPAhOdj/uT2XCeZim+iCk5W?=
 =?iso-8859-1?Q?/PoklfGAMEz5jaQArc/LTJFbhjLUqQHFV7q/T4GZ4ac2cj0+SDhgHOcOXa?=
 =?iso-8859-1?Q?/86BYA3BnJZl79H4IObHqVJpOmt/EQlLHS3et/IU3hBK5MEf5GdF279Wjg?=
 =?iso-8859-1?Q?1U3puAoRu+m6z88Nh/ccWvG5B8PvWdFcDa2H/bxD01ZZYLUvF3hpScL4Y+?=
 =?iso-8859-1?Q?5ofyD7wLc+mT8PxcCemwntr+ARbZ3thMpaBvthJY+QNYU8B0QQyZpbUNK6?=
 =?iso-8859-1?Q?Vn68VZEDFytFAIku59VOhfr6MnDHC7SnkGoWA0vChq9ith4kM4Mj5yoFQ4?=
 =?iso-8859-1?Q?WHySgZDV1JziQMpSNrMk5TtyhBrSagn2cRHozCFlX97kdRx3tx3ndqgw7v?=
 =?iso-8859-1?Q?bdtpPRLqOUTAlKULaod43Nf+Rth86TZ9bUXMfEAhjM3maFcMjxnUABa+JE?=
 =?iso-8859-1?Q?maKFj8rGcf7arDXRQ7REjIzgtfTAVpc2ozu9NDuJnhYeZhPzBioNMBhmp0?=
 =?iso-8859-1?Q?7zfAk1GwoCrcfEPlWWJ/ombzmJaNL+8Q5XyvZMms/9AhhEuCGPN67XTzOf?=
 =?iso-8859-1?Q?/SyzndslXmW0IlSUaTVVEe2w3qRkCpFgvLH1gFGMDiefn2K64bsSOIwej/?=
 =?iso-8859-1?Q?3epeIiN7rBAo577yzhwoV6fYlP+Dd2TNqIRwShwHOkzv/OR2xOft7sx/9l?=
 =?iso-8859-1?Q?XM2LP4ooCRpViVZEtln7MNaGIHW+861Lo9j4mbzeE380YkyNaV1QU3zQuv?=
 =?iso-8859-1?Q?QFOprZkzXDoc8UkmjsESscxD+5JfLa1H1MqtceQjjrXHsHRFBcJW4v0fuA?=
 =?iso-8859-1?Q?DO29tv2cC3MSLPYinrESlnZ008TUGMx4tafS/FLYTkgs5nr6CFhplS/3Jb?=
 =?iso-8859-1?Q?MX7bUcbVDEodMyL7b1Iv1tssE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf3ef3f-627e-4b8c-e8cd-08d9e18810d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 11:27:56.2979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nCpE1MSvTCogdwjlI3jUFAMve5NqMZ+WqljQAsHd4R6Y2m5D3D0bsXfZsaeL6vOw2j9qRBYoTDRxhjjDB6cs5nH9C/gPwT3/1/xLrEk6OX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3227
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This series allow architectures to request having modules
 data in vmalloc area instead of module area. This is required on powerpc
 book3s/32 in order to set data non executable,
 because it is not possible to set executability
 on page basis, this is done per 256 Mbytes segments. The module area has
 exec [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.9.83 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.9.83 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1nD2wd-0006y6-ON
Subject: [Kgdb-bugreport] [PATCH v2 0/5] Allocate module text and data
 separately
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

This series allow architectures to request having modules data in
vmalloc area instead of module area.

This is required on powerpc book3s/32 in order to set data non
executable, because it is not possible to set executability on page
basis, this is done per 256 Mbytes segments. The module area has exec
right, vmalloc area has noexec. Without this change module data
remains executable regardless of CONFIG_STRICT_MODULES_RWX.

This can also be useful on other powerpc/32 in order to maximize the
chance of code being close enough to kernel core to avoid branch
trampolines.

Changes in v2:
- Dropped first two patches which are not necessary. They may be added back later as a follow-up series.
- Fixed the printks in GDB

Christophe Leroy (5):
  modules: Always have struct mod_tree_root
  modules: Prepare for handling several RB trees
  modules: Introduce data_layout
  modules: Add CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
  powerpc: Select ARCH_WANTS_MODULES_DATA_IN_VMALLOC on book3s/32 and
    8xx

 arch/Kconfig                |   6 ++
 arch/powerpc/Kconfig        |   1 +
 include/linux/module.h      |   8 ++
 kernel/debug/kdb/kdb_main.c |  10 +-
 kernel/module.c             | 193 +++++++++++++++++++++++++-----------
 5 files changed, 156 insertions(+), 62 deletions(-)

-- 
2.33.1


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
