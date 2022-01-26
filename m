Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A68AB49C3BC
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 26 Jan 2022 07:38:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nCbx8-0006Aj-3u
	for lists+kgdb-bugreport@lfdr.de; Wed, 26 Jan 2022 06:38:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <christophe.leroy@csgroup.eu>) id 1nCbx5-0006AP-KL
 for kgdb-bugreport@lists.sourceforge.net; Wed, 26 Jan 2022 06:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dUd86j/Zkow3iianPHch57YCimU5xY+HA/U24e3pmjk=; b=iX6DGnHf2OWCOayBqkTc8Obn6Q
 LuSH8VBr8kiZvlhe2AveVsHhRsYTYuRqI7Wp4TA1SF/+twf/r9FHVrLrCbY7KqGaGyO45DI9nXtjP
 66GP/Wc0YCWuGh+lJKM+DDS6cMdY17XeOc2sJ5fLeyZjpyELDkxi92AMw3HIP5KHzUBI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dUd86j/Zkow3iianPHch57YCimU5xY+HA/U24e3pmjk=; b=YS5MkMsLqISh8oNL0Z9U02ut0o
 fn22qVJN2JvikgTL2yM54TWRLJee/Oc3Q3ikPy8DHOfmvvjooxPmzoOFRfHT5WB7idk1DBJfSLNzg
 gYkkkvPMvHKWEGH4IM813uZ1AEbrpW/YI9j+f/0u56/z0xhg5r4HPEzYiYe4mQsMbuzI=;
Received: from mail-eopbgr90059.outbound.protection.outlook.com ([40.107.9.59]
 helo=FRA01-MR2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nCbx0-00DkER-Sc
 for kgdb-bugreport@lists.sourceforge.net; Wed, 26 Jan 2022 06:38:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQc+TrQDU3AqQ+b3Oys2mh5veNMdoMCyYT5Vp+sqD/c/8TTL2p+wq4WvUyHV+ym+0xMQFB1ZpOwfVVXpXg/IzQarMZ3ZcgY8NKuZ3Z3INEirhUfe1SDQaAZmMTOFXsrY9mPbFY/H8rawFcJaX1slZ/ekmO2+zGNouRogMpHjVpbNMFKxwr+qHtxaIxYa/xJnyjCp+pQbTg5mJhFMg+plkNTIMQrQP0lzbmVlnPGVKvftBGwTECgXyKIKAJRZ86tbhq1maAPJxPegKiYHmEOIiBEBsX9/J4qE8ZwIR0MyuXnxO+mZ/UzuLGfmb8O7Bbb2Gk7FEfC74nF1Hq/FCiB1uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUd86j/Zkow3iianPHch57YCimU5xY+HA/U24e3pmjk=;
 b=j2HqrRjsqpum9xgZLRzIrBFRUx7S5I8wdd++TLZz6ZDpDOA26ok08HycjQel68Qmw35ryw7ND5DkjNpV0ALX8BAWWO5Fxkj4YLH6qyruFeHJ8GsReKkiR6dSKHfb8rXIS9QaXJ18RqDheA9boMRUrwYSMX1iClZomQexY6Ch8MT+WOYoH06SEhBOZo88TTUcRSrzXeN5zAqq8IanGunJlI7E7wRA9TY/R+MmnqUZQe8nfFzdryd6pfSow6BL1veQNMS8oYErdzUxe5JDsDF8IkT3WHvLE7EjBkeXhHqP6smfRh6PO5w0zXGp8oNLfSUwSt5HQplJz/RK3/tT7ahV+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3451.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:14b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 06:38:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%6]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 06:38:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luis Chamberlain <mcgrof@kernel.org>
Thread-Topic: [PATCH 6/7] modules: Add
 CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
Thread-Index: AQHYEQPri54wm9k2kUic7oR3m4zr7qx0PdwAgACexIA=
Date: Wed, 26 Jan 2022 06:38:30 +0000
Message-ID: <b49235ef-1fc3-7b8f-7e23-79f461d83e18@csgroup.eu>
References: <cover.1643015752.git.christophe.leroy@csgroup.eu>
 <848d857871f457f4df37e80fad468d615b237c24.1643015752.git.christophe.leroy@csgroup.eu>
 <YfBnNuXpR2l2AuCP@bombadil.infradead.org>
In-Reply-To: <YfBnNuXpR2l2AuCP@bombadil.infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77b3bc4d-fabc-449f-b2dd-08d9e0967767
x-ms-traffictypediagnostic: PR0P264MB3451:EE_
x-microsoft-antispam-prvs: <PR0P264MB3451D227325A69A00E6EA0B1ED209@PR0P264MB3451.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fY6Smy7HuhLdPWgiYKvvFrUnD+UTjaLkpJn1J+/zMiw0zq+ecw7vnz1cY5EChTrw4ZLP4BSoBnNggTv4eUUHh0/WW7geGDy6Y492uW0aqJTZeP80Zyy/U3B5MBJ8STqfXwwOq528KV2MSqjk7Eu4SzL/YdwKLwnJ3b2+uTEuN4myX0KTAbGD/6iLciob3pm9ZnbP7yorEsW5wkM9wn1oNxVAl4OIFHPisTMFQOopajwcV3Ou17FOqm/APlNkOH8b9dvf+b9/xP+XGO+XCt9NplLdRAxolL6IF7xMMsnG8e792xBwRJU00xgyjNPozkzHsCiXinhnKTHvkyi/FWFCfvKcp1o0kho+G2PaIg3YJL6G24xDicw+vBJPFWNFVGVy84CXluRdM+EOJofTzCvFbR/oqyanqvNuUHVq9W8nVZxQcaw8r8SVTwP5v/1IWfLUGGkdzD7fboMgRu90FQ+xh3bwgv0ZO8UBEj9ziwQxGOkwdglt+2hrRovrd4sXyZ+eo/XN+/glvIQvZx8TCIEHrtah6U8BsNOtkw3mPWxmcaV6eCOxqq2lOwYVdPkSHVc1es3KR6Q8IiIKqTO+w+n8Jj39/b99aPfJ+fAVrtLwUlgj+OPsNYLq10OYURlhkHITrt9EHZwExaqqZ6rnV8sjESNr3jvCg8g1WrLckSujfVLmywDf55lQTH9U7pTgsvPv63+kr5z1QGWzLvuUjV8aUH/0TZ1L1by8W8weAbzTI3HyBcxmzfWRazfP3lfBS8CB4do0DB2okMOUYr/lSu97oV+oJZk1cnRizd3l008GB1DrwIwnISxOHELYt23rKro2aabiRN4CtdJjBPicqzSSaJ3MYiQ9OMTy1rcfKCwnb7Pp8jUUmKdQ2Xh1zJ+5lJDt10sSZ8h/3mA2tMoW6MPbKQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(122000001)(508600001)(966005)(6486002)(5660300002)(7416002)(44832011)(2906002)(31686004)(6512007)(36756003)(64756008)(8936002)(8676002)(66556008)(66476007)(66946007)(316002)(76116006)(91956017)(86362001)(6916009)(54906003)(31696002)(66574015)(4326008)(83380400001)(66446008)(2616005)(71200400001)(38100700002)(186003)(26005)(6506007)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjN3SHgwWURwMWcrZmRpVCs1alhyZzZNRnhlQ25lVmprT1V5Nm5SOEhzTHNH?=
 =?utf-8?B?N0RIUEJQek9ycTRxMzBNLzd4VGRFa2lObFZrbGRwbGN5d1Vwa01YYVBWaUJ3?=
 =?utf-8?B?M05pYnNpYVA1cEtBSk9ZS3V4cWxEMWlkVks2ZWhZendYWGlhRGtsZTJWZVhR?=
 =?utf-8?B?dy9aNTJ1cEU1STJkMlRDN0Q1TzFvMHpOanNsSWUwa3ZkbDJHZ3dGTW9KNm5X?=
 =?utf-8?B?QTBrSXJvWWtVVzRBOHo3YXZWakZEZ1ZWZWYwMmVJeHQrNEU0bkpTUERUYjJq?=
 =?utf-8?B?eENra3BDVmNjcUpNOUszaDFTa2dZSFB6VmtqaGpnNWtXeHVkVVorWm5uMS9D?=
 =?utf-8?B?WitDZkNTWk42VTQ2aDZKZ0hiTnQ4eDF5S2ROWFZuQlVtRzRGUW1nN2RqWVNQ?=
 =?utf-8?B?Z2FtTWlkSkM3U2UyT3dGSXNvQnJQaTFEMTcwd0QxUFNDU2YwcXdxVy9HZFlq?=
 =?utf-8?B?TkZSQWpMeWhyWnlUalFVTWdZeE92ZWU5OHhDZzhoMFBiOWxLaDNnbDVySHFP?=
 =?utf-8?B?THo5R0RVZHZhMEVlanovclNjdlFGanRjVDJFVW9uMUNZZjZwc2k2RnFwZ2p0?=
 =?utf-8?B?Y0FLcHREUDBlQTRZVkIrM01iditnVDhXTUIwSGRFeVhnYm14TnU5T1c3YklQ?=
 =?utf-8?B?eGJWWEo3T1l3RFI3Y1dUYVY1N1IxSTNNa21wcEVLUXJhT1U4Z01EemhrUEFx?=
 =?utf-8?B?RTkvSlBLUXdMekRTL25DaS95ZDBHTmhQK3QyNk1qbDRmUGUydFBjVmZ1YkV5?=
 =?utf-8?B?WDluVDhPM0xqQ2tGczJ2bEtoNGJjKzFzb3BqSFdyL0xLVEdDU2JCSHJyUGQy?=
 =?utf-8?B?S09SRmV1RE1pdFFJL280YlhWR3k4bTJnM0QxUDdsSko1eGFQL0kxa3YzNEtN?=
 =?utf-8?B?U3NTWVcwcTNFQkY5ZGc4SGNJZThVNUdoOWZud1pnMGVoRGhObkF6ZTVFbkdo?=
 =?utf-8?B?Q2d6NUdZeDJQZitRdnh5QTdXWUMxd3QxMWRqKy9ZeEduWWtNemhDY1ZyM0Rm?=
 =?utf-8?B?WmhGSWJodmU1Y1JUWElCd1BTektBUkw1Y3JoQnNvSWhMY01xY0xHekhEajZV?=
 =?utf-8?B?YnNlRGVodFBHMkt6d21FSjhjN21nVnh1MkViVWM3SHlzV3F5MUpmTUdNcTJO?=
 =?utf-8?B?THlyWW9jV3VHaDFjeEZEamZGaWl3RUtaK1ovMDVlNk84TzBIYnBuQjRUSXdt?=
 =?utf-8?B?R3d1ZW9EOC9vY2ZVOGxBaTBtMzI3aGNSVVdMenN4MWdjOTZVMjZmdDgxeFZD?=
 =?utf-8?B?cnFvOXorKzB2Wjl3Qk9HTlA1VFhhbGEyTCt3cjBUek43eXVYbFM0Z2J5TzNw?=
 =?utf-8?B?T3dRUnBSNmJJY3lNNGFmWXFnY3MwTGJRMW9OaDIvWElzT0NPUElTWXBtOEpJ?=
 =?utf-8?B?bDZOWitPKzBOUmllaTZPRS9tMkNFU0hpdk5FdGZjNVpHVkpiczVVMVFEVk85?=
 =?utf-8?B?NFhrbGtRbmVrVkxzek1QT0xFNXBXbFdpSlBoZTdkZ0g1Wlh4MzFhUzhaeGdE?=
 =?utf-8?B?bTFtVlV0WDBETkphWmlOZzFieFcyMzBYMDV5Smk5cnpiTnk0QkovWFNuUHVm?=
 =?utf-8?B?aXdTaVdGSW5Wdk9qZm9EcGExMDdkWjU5QWZyajVtNmNIY3ErcVUyOXVnT2xQ?=
 =?utf-8?B?bXMvMEY3bmZHWlQ3RnU3aWlKMWtxWEFsa1JEdUZINURvUDkxYXovWlVHQlcr?=
 =?utf-8?B?Vm5qZnRqam9Ic2pOVFhIcS8vN2pGczJlL3VrYnhTbzlMOXNEN3BsZWhYTkRy?=
 =?utf-8?B?S0dNUWlVbFV0UDVsUm52Qk82RFBFVHhLTTZGNElhTlJBbVlhdW0xcit6N2FY?=
 =?utf-8?B?Q1BjTEpjZk9YN1B2L0h0Tk4xMjZldjloRG8zOHV6S3ZiTkZYMCtoN0U4VXJp?=
 =?utf-8?B?aEx1UXVxTTViTWNMdUxSSGpJbnVjWnVrV3YvYmVRbnhZOStuczZJUXd1TlNW?=
 =?utf-8?B?WjYrVmlyS1dUZjJpWUZSQ2ZUYUY3SnVva3pudmM5ZnhHeEo5Wit4Y29udUJQ?=
 =?utf-8?B?Qkk1ZmVKMjNjU1prUUJqTzhybnVwNkh4bU5hRnNsZEFHcjVOekNvbUFiNy9M?=
 =?utf-8?B?bnVrdWxwb2h4RGVDNWtZajBRd2J0RjFueDAvQWlOWTR4M2R6WFBtaVRLemx4?=
 =?utf-8?B?S1ZENHFITkQ4ZkM1MHA0cHR1ZWF3QnpsRVBHREVuM3hOeGtUUmpPVGh5MEds?=
 =?utf-8?B?bC92c01YazFlcmVUY1lNRGI0eG5maExlbVYxWkVndmJYMHBvWmx6TG13dUNi?=
 =?utf-8?Q?9pfSTmklcEQ/IABTAJjjJ3IBTls7ckSB0/GP9oyW/g=3D?=
Content-ID: <1AAC6DC17686F04A922EA2975729582E@FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b3bc4d-fabc-449f-b2dd-08d9e0967767
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 06:38:30.1386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UqEYRDkdo/d0tNaPatEW2eJqazrmiaqYFrMy4DM9cJP8Brvfp455B1UOn9zgWm5kgqOZ1MWyuGdy1vvmiRf8z2ACqeZv+oneY5jscjuXzp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3451
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Le 25/01/2022 à 22:10, Luis Chamberlain a écrit : > On
   Mon, Jan 24, 2022 at 09:22:34AM +0000, Christophe Leroy wrote: >> This can
    also be useful on other powerpc/32 in order to maximize the >> chan [...]
    
 
 Content analysis details:   (-2.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.9.59 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [40.107.9.59 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nCbx0-00DkER-Sc
Subject: Re: [Kgdb-bugreport] [PATCH 6/7] modules: Add
 CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 Jason Wessel <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

DQoNCkxlIDI1LzAxLzIwMjIgw6AgMjI6MTAsIEx1aXMgQ2hhbWJlcmxhaW4gYSDDqWNyaXTCoDoN
Cj4gT24gTW9uLCBKYW4gMjQsIDIwMjIgYXQgMDk6MjI6MzRBTSArMDAwMCwgQ2hyaXN0b3BoZSBM
ZXJveSB3cm90ZToNCj4+IFRoaXMgY2FuIGFsc28gYmUgdXNlZnVsIG9uIG90aGVyIHBvd2VycGMv
MzIgaW4gb3JkZXIgdG8gbWF4aW1pemUgdGhlDQo+PiBjaGFuY2Ugb2YgY29kZSBiZWluZyBjbG9z
ZSBlbm91Z2ggdG8ga2VybmVsIGNvcmUgdG8gYXZvaWQgYnJhbmNoDQo+PiB0cmFtcG9saW5lcy4N
Cj4gDQo+IEN1cmlvdXMgYWJvdXQgYWxsIHRoaXMgYnJhbmNoIHRyYW1wb2xpbmUgdGFsay4gRG8g
eW91IGhhdmUgZGF0YSB0byBzaG93DQo+IG5lZ2F0aXZlIGltcGFjdCB3aXRoIHRoaW5ncyBhcy1p
cz8NCg0KU2VlIA0KaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4cHBjL2xpbnV4L2NvbW1pdC8yZWMx
M2RmMTY3MDQwY2QxNTNjMjVjNGQ5NmQwZmZjNTczYWM0YzQwDQoNCk9yIA0KaHR0cHM6Ly9naXRo
dWIuY29tL2xpbnV4cHBjL2xpbnV4L2NvbW1pdC83ZDQ4NWY2NDdjMWY0YTY5NzYyNjRjOTA0NDdm
YjBkYmYwN2IxMTFkDQoNCg0KPiANCj4gQWxzbywgd2FzIHBvd2VycGMvMzIgYnJva2VuIHRoZW4g
d2l0aG91dCB0aGlzPyBUaGUgY29tbWl0IGxvZyBzZWVtcyB0bw0KPiBzdWdnZXN0IHNvLCBidXQg
SSBkb24ndCB0aGluayB0aGF0J3MgdGhlIGNhc2UuIEhvdyB3YXMgdGhpcyBpc3N1ZSBub3RpY2Vk
Pw0KDQoNCllvdXIgcXVlc3Rpb24gaXMgcmVsYXRlZCB0byB0aGUgdHJhbXBvbGluZSB0b3BpYyBv
ciB0aGUgZXhlYy9ub2V4ZWMgDQpmbGFnZ2luZyA/DQoNClJlZ2FyZGluZyB0cmFtcG9saW5lLCBl
dmVyeXRoaW5nIGlzIHdvcmtpbmcgT0suIFRoYXQncyBqdXN0IGNoZXJyeSBvbiANCnRoZSBjYWtl
LCB3aGVuIHB1dHRpbmcgZGF0YSBhd2F5IHlvdSBjYW4gaGF2ZSBtb3JlIGNvZGUgY2xvc2VyIHRv
IHRoZSANCmtlcm5lbC4gQnV0IHRoYXQgd291bGQgbm90IGhhdmUgYmVlbiBhIHJlYXNvbiBpbiBp
dHNlbGYgZm9yIHRoaXMgc2VyaWVzLg0KDQpSZWdhcmRpbmcgdGhlIGV4ZWMvbm9leGVjIGRpc2N1
c3Npb24sIGl0J3MgYSByZWFsIGlzc3VlLiBwb3dlcnBjLzMyIA0KZG9lc24ndCBob25vciBwYWdl
IGV4ZWMgZmxhZywgc28gd2hlbiB5b3Ugc2VsZWN0IFNUUklDVF9NT0RVTEVTX1JXWCBhbmQgDQpm
bGFnIG1vZHVsZSBkYXRhIGFzIG5vLWV4ZWMsIGl0IHJlbWFpbnMgZXhlY3V0YWJsZS4gVGhhdCdz
IGJlY2F1c2UgDQpwb3dlcnBjLzMyIE1NVSBkb2Vzbid0IGhhdmUgYSBwZXIgcGFnZSBleGVjIGZs
YWcgYnV0IG9ubHkgYSBwZXIgDQoyNTZNYnl0ZXMgc2VnbWVudCBleGVjIGZsYWcuDQoNClR5cGlj
YWwgUFBDMzIgbGF5b3VudDoNCjB4ZjAwMDAwMDAtMHhmZmZmZmZmZiA6IFZNQUxMT0MgQVJFQSA9
PT4gTk8gRVhFQw0KMHhjMDAwMDAwMC0weGVmZmZmZmZmIDogTGluZWFyIGtlcm5lbCBtZW1vcnkg
bWFwcGluZw0KMHhiMDAwMDAwMC0weGJmZmZmZmZmIDogTU9EVUxFUyBBUkVBID09PiBFWEVDDQow
eDAwMDAwMDAwLTB4YWZmZmZmZmYgOiBVc2VyIHNwYWNlID09PiBFWEVDDQoNClNvIFNUUklDVF9N
T0RVTEVTX1JXWCBpcyBicm9rZW4gb24gc29tZSBwb3dlcnBjLzMyDQoNCj4gDQo+IEFyZSB0aGVy
ZSBvdGhlciBmdXR1cmUgQ1BVIGZhbWlsaWVzIGJlaW5nIHBsYW5uZWQgd2hlcmUgdGhpcyBpcyBh
bGwgdHJ1ZSBmb3INCj4gYXMgd2VsbD8gQXJlIHRoZXkgZ29pbiB0byBiZSAzMi1iaXQgYXMgd2Vs
bD8NCg0KRnV0dXJlIEkgZG9uJ3Qga25vdy4NCg0KUmVnYXJkaW5nIHRoZSB0cmFtcG9saW5lIHN0
dWZmLCBJIHNlZSBhdCBsZWFzdCB0aGUgZm9sbG93aW5nIGV4aXN0aW5nIA0KYXJjaGl0ZWN0dXJl
cyB3aXRoIGEgc2ltaWxhciBjb25zdHJhaW50Og0KDQpBUk06DQoNCmh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L3Y1LjE2L3NvdXJjZS9hcmNoL2FybS9pbmNsdWRlL2FzbS9tZW1vcnku
aCNMNTUNCg0KQVJNIGV2ZW4gaGFzIGEgY29uZmlnIGl0ZW0gdG8gYWxsb3cgdHJhbXBvbGluZXMg
b3Igbm90LiBJIG1pZ2h0IGFkZCB0aGUgDQpzYW1lIHRvIHBvd2VycGMgdG8gcmVkdWNlIG51bWJl
ciBvZiBwYWdlcyB1c2VkIGJ5IG1vZHVsZXMuDQoNCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L3Y1LjE2L3NvdXJjZS9hcmNoL2FybS9LY29uZmlnI0wxNTE0DQoNCk5EUzMyIGhhcyB0
aGUgY29uc3RyYWludA0KDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xNi9z
b3VyY2UvYXJjaC9uZHMzMi9pbmNsdWRlL2FzbS9tZW1vcnkuaCNMNDENCg0KTklPUzIgaGFzIHRo
ZSBjb25zdHJhaW50LCBhbGx0aG91Z2ggdGhleSBoYW5kbGVkIGl0IGluIGEgZGlmZmVyZW50IHdh
eToNCg0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTYvc291cmNlL2FyY2gv
bmlvczIva2VybmVsL21vZHVsZS5jI0wzMA0KDQoNCg0KRXZlbiBBUk02NCBiZW5lZml0cyBmcm9t
IG1vZHVsZXMgY2xvc2VyIHRvIGtlcm5lbDoNCg0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvdjUuMTYvc291cmNlL2FyY2gvYXJtNjQvS2NvbmZpZyNMMTg0OA0KDQoNCkFub3RoZXIg
ZnV0dXJlIG9wcG9ydHVuaXR5IHdpdGggdGhlIGFiaWxpdHkgdG8gYWxsb2NhdGUgbW9kdWxlIHBh
cnRzIA0Kc2VwYXJhdGVseSBpcyB0aGUgcG9zc2liaWxpdHkgdG8gdGhlbiB1c2UgaHVnZSB2bWFs
bG9jIG1hcHBpbmdzLg0KDQpUb2RheSBodWdlIHZtYWxsb2MgbWFwcGluZ3MgY2Fubm90IGJlIHVz
ZWQgZm9yIG1vZHVsZXMsIHNlZSByZWNlbnQgDQpkaXNjdXNzaW9uIGF0IA0KaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9wYXRjaC8yMDIxMTIyNzE0NTkw
My4xODcxNTItNC13YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbS8NCg0KQ2hyaXN0b3BoZQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9y
dCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
