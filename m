Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7D44A7F9D
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Feb 2022 08:07:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nFWDR-00064b-E0
	for lists+kgdb-bugreport@lfdr.de; Thu, 03 Feb 2022 07:07:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <christophe.leroy@csgroup.eu>) id 1nFWDP-00064V-GK
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Feb 2022 07:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yr9CRfsSBt5+FqWFuvgZmABummyDLi3LW29ya3ZZLh4=; b=RLCsmCv45Lj/PXLswzzNpPwXaI
 kezn0lQU1Cnbi0avJCifdnPnT9EQLTVEaMDkheU5kEZhvVd6ZSzx0m6Mvx2V3fBNZ4NZEjdsz5zKJ
 9iXLo9OZCkmMn2tUaX1WzjihGno4Sobl6RjNle/KmKVL48dfIj6BuAhc7wTZVC0p7+gc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yr9CRfsSBt5+FqWFuvgZmABummyDLi3LW29ya3ZZLh4=; b=DiUOqUF5mygveeW1emleEj6UIS
 ii3LgNjXEFyxSeDB9f1SUy93SeTb2DKzW0Z2Fll0UvetO01KqM+8v3MM6PexPlkURAcasZapjSpS8
 1x5uLoVsA52fBimK0DvApwuZUU+fnBb7IwzjM2jskKmi80gLgTNYN2qfM4fIF+9uBln0=;
Received: from mail-eopbgr90085.outbound.protection.outlook.com ([40.107.9.85]
 helo=FRA01-MR2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nFWDK-00ETak-Lu
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Feb 2022 07:07:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biAfvP3n+niX8SnbMd0mPlKo4JuNCYSBdTY/mpIBZrUOrwKJ75OLMLDBalCjr04qfSIVOWdh9iwxO5gKlOFsjBZgqC/N/io53JhqnnvMWytzFREUBQePTlOpKjSU1UYX/Te1SVSCrCQzpUcEeot0Ysc90qcqN7oELmE/YnhcHjJycj1HN7EDPqhx77e/qk81OshTSNVXiR/Ln4deJ5LXLXZKfCcJqqVQz8UGi+KlxeYv5jiIMCaEALktb5vulUjy2y2kp8PqRmpyGzdR4oQ96eNa9aap/vVzCqQ3pVKzYpBS1ySFo+FSlN1CVEoHuewQNQuNLXUbd8JES0pEc2UAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yr9CRfsSBt5+FqWFuvgZmABummyDLi3LW29ya3ZZLh4=;
 b=jlQzmiCBZX/AAjFXcTBWNgBb2KlsasMxe6BDMCJNeTTLoQ02J1gl0BXy448UG0oJf2hq1NSVeQerL+fMRvS8arZvCpT9Yk7JBvQh73aSAj/xPQksMINCag2iJoEqXKwmWWM/uVGnCujNaWisv+lVZwDHJMppuMY2Fb9OMQI4DYn6pijGfD1jUID3T9A2NpXVaNnBeU+vwkI4IZ8gz4Us6lVQlylgT+jai3SqP6uRKAnv2o54XezHQbp+Y6se38bPLazdh66zDpfEBzENH0p06L5E2F5UATVfUis7clmAiZm6vl5GW7J+FSIDvkrJ6H8pOlzAKzps7DkqOnffNJS2jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2731.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:18::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 07:07:23 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%9]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 07:07:23 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>
Thread-Topic: [PATCH v2 5/5] powerpc: Select
 ARCH_WANTS_MODULES_DATA_IN_VMALLOC on book3s/32 and 8xx
Thread-Index: AQHYE3D37kysOO3Vq0mRXtsXlcd4bayA9I6AgABlQgCAABiuAA==
Date: Thu, 3 Feb 2022 07:07:23 +0000
Message-ID: <9cab4adb-bd4b-48d5-d63c-33a0f25c97e4@csgroup.eu>
References: <cover.1643282353.git.christophe.leroy@csgroup.eu>
 <a20285472ad0a0a13a1d93c4707180be5b4fa092.1643282353.git.christophe.leroy@csgroup.eu>
 <YfsVhcpVTW0+YCl5@bombadil.infradead.org> <87h79gmrux.fsf@mpe.ellerman.id.au>
In-Reply-To: <87h79gmrux.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1a8f478-a30c-4d83-901c-08d9e6e3d38d
x-ms-traffictypediagnostic: MRZP264MB2731:EE_
x-microsoft-antispam-prvs: <MRZP264MB2731FED6AE078173E43CE237ED289@MRZP264MB2731.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cbaYguyOvKQujNjHt1TAkL/cnqYbvSYYnvN+5CtZQ2NfZ2AeXJDV7Wx3QNuK1bHj4xXxSYEbmI5UXTIDBpMzwGpSDdcKuEM84S4cZhR8gIco5FhUgIfofd7rJfNa0M0YQlq5U8YUKO/O1LvHJjfRG4wgbHR+tMsYfuipIAXHzFYNRmZJHT+7I5oH2SZoARE3GC1/Z834lbTLcuGtQpb+CDau+4hNd6g7ogevsU+fR4NUArqtCiI8lB/AIObJWXtLkndD/3WQbkKyH6vT+bpV+J+Ap+8syRKQqAzjAV/BzmL678lhpRlrqQg0cQyWVi541Xje3i3ogzHSksiyugH8/mfn30VZDpn+ue7ag2HldgRWflUmswCxzk2j72n1FSfa/QN3cMcv0TCbGQGa/iymXZYgwobXY2WVyQTgNFpBWk122z5fVwV5pCA5x5XCm8yth4arhdWT+k/usxtPYAOa8Yu+R7bdp+aNJfcC/U8HUFUfTw+fEhvpghI8Q/oGYpT0NZ08Vfdm9r3WrB1LPAAl43Z5lThL/Sq7laPEu2l4iifscJ9SvSlW81Ra0ouLyJbDeBYRQbY6VV7xS+txMgSP3eRWLSZe7WXT0BBhgOMKMFHoJgQPUxtz6fZonvtjLP6GlViCyJ71uIL7S2Cxev/FADu2wr4+VuWE4aAhmyfT/s0Wizzrvw/RaV2nDPomHGJ178zKgeDn9tF8Jv0nIGS7VjIrC0Ag9GhY7gKbolLqqOYU1b4NNQOcToqlqaIiBXF3DTeEj6a/oHiVL25Yh16FIA1dSu1ptDYdUO8x+O4TaK4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(6916009)(316002)(31686004)(66556008)(66476007)(66446008)(64756008)(66946007)(8936002)(76116006)(91956017)(8676002)(7416002)(6506007)(4326008)(508600001)(6512007)(2906002)(44832011)(36756003)(5660300002)(2616005)(6486002)(71200400001)(186003)(66574015)(38100700002)(122000001)(38070700005)(26005)(86362001)(31696002)(83380400001)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFVXcGc2bnU1cVhlWEU3WTBoTXV3ekxjVzlhVGlzci9xVHNHVXlhbTk4Wlls?=
 =?utf-8?B?MWl0WHByRkxqWWFpdUhvalIxOEZCWWdLSHV0RVU1R0Q5S1o5Y3kzbFNhYTJl?=
 =?utf-8?B?NndkQi80Q3d1KzRMUVRjRnlTcmcrWXJzcE5QWDZUT0pQMkxKcGh5d3R6aFdL?=
 =?utf-8?B?dWJkczlYbUVZRXN2U2c1MUgzczE4UXRCR0lzaU1penJkSVNEbitBRC8rUVgw?=
 =?utf-8?B?YVVOTzI2cFk4OGtiREhPZ1c5MVloSXR6SUFKeWpiWUxmNWh1Q0xsSEJET0p2?=
 =?utf-8?B?eEpkSWszR3RKUVpaMlFBaFAzZmt5MENaM050bE9ZM2l0ZGdyNWFBUEZKYUtG?=
 =?utf-8?B?VXU0OVAwZUIzTWJ3aDhWN1pVWVdBMnZXWXZ3SmJjaDlyRHd0SWpvR0Fkd082?=
 =?utf-8?B?MVRlbnRtMzFJNnVJSG1BWGRWbGRNWEVxVHdtWDJvVTZDWmx5bW9TV2l1azM0?=
 =?utf-8?B?dGlkSTRnT29wbEtCR2U1dUpCSm1JOUFxdWVPb3A5V2lPWWJhZElWRVpBUEhy?=
 =?utf-8?B?bkhpTS82V2YwUlpZTGpENmxoZk5QT3A5eXJoL3NzNjAxSGoxYWFmZ3ZtS2xS?=
 =?utf-8?B?ZUJNV0hjWm1vMFBISEd2Ni81Qkx5YTNlZXZPdU5mT3hhR1NZL2YwbWV6UjEw?=
 =?utf-8?B?MkhQWHRiWUxmcm5lemdFOTdWT2h6N2NUQkhrNFV2NzBVNjR6aElteVp5MlVr?=
 =?utf-8?B?c2YvUlM5UlJGNStxeE42MUFQNmdNRnZNM2pRZFVrYVhkZHBYSGpiWlNFcHVE?=
 =?utf-8?B?NzhuaTM0bjhaeHBuQWYyMXp5TGJST2krS2xjeXpPc2FwTHpZN0xpUFhvZFkr?=
 =?utf-8?B?dmw5RHo5clZCelBJRlhPMmUrVmV3RWxnY0U5UXljNHZJT2pBS3YxUEZWTHQ5?=
 =?utf-8?B?TW45MXRlRCtBMElPWnY4Y2kwbmVraFE3RDZaTXgvbkJMczlVaEdIbTEyTmJU?=
 =?utf-8?B?YU5zWmJQWGxxSlBpZWdaaUlsekt4WHRoY2JxNjhhZmJ6Y1Y1a3R2T05lMEts?=
 =?utf-8?B?K3hlbnZTbTBFNjhldE9JMnFCUmpPY0E5aDhTRmMxbU9JUFkzckFMUU9lNTJL?=
 =?utf-8?B?TWlxM2ovaWdEczJHU1RoaXBuYktLU3RZUFFlZXBjTCtoNnp5UnJoRW5PcXdS?=
 =?utf-8?B?T05Pdjl3RmZVWkxDS3Vlb09oMHFUek1OYU5xZ2syM3QyV3E5VEswRkphQjFM?=
 =?utf-8?B?VnNQRjdId3lCcFN1a254QWdiUko0TGlvTHdxdG9kU3J6Sk1DZEJYaEoxNnZo?=
 =?utf-8?B?bkc3Mncxa1NVeGpMNkkveGxkVHdEczRqNG1LWnQwZXN5b3p3dHhoM2t0TmhI?=
 =?utf-8?B?dEFLdFI0M0pobmgvdC9McnN0YzJKMGJsamF4eUFFVzNCOE5PbTVIT1NmOCsr?=
 =?utf-8?B?TC9pY3lQQXRjeW5KWTdkSlhydzlsdmtnZlNmNmYybENGdmtVT0lVU2c5OFdS?=
 =?utf-8?B?MzlEYWFiZnV2dlVrNVBCajBld1RxTFF1VDFqUnJYOUNMam5ZekxlK2FCZnJ2?=
 =?utf-8?B?RzJ4ZkNoc2NOOTRWbmFBZkZFQmNYM2JBOGhUZVllTTUvaVh4RWkvZS8xZ0V1?=
 =?utf-8?B?bmtkU2pKdmpwdURIaVVabzNCZDdiUFhnN1ppVHVaUHZyN20zd21GV1NEcWto?=
 =?utf-8?B?T1BKYXgvVlltejhkc1dzUFhFSXFFazQ5NUdHWHVBTzl1ZjA0WU1FZktMM1RX?=
 =?utf-8?B?aXRlalRYYTBxMi94dVVZamJ4RU91c0ZtMnlESzcrWTNUaWJFSjhXQkdUdktR?=
 =?utf-8?B?NXFpREJUNmdoSkJqaHRuV2hqOElBWW9OZFpHTitjVkRjbHVyZGdJZDRLR2Q5?=
 =?utf-8?B?TjhJUE5CWUNmTFhLd1AzOUdhMitUN3NwU3FiaWNIc1dyTG8vOEl3Qm51Y3pl?=
 =?utf-8?B?djRSMWlYckdod1paaElBdVhuQythWHh4NjFFWmdmU3hqVzZRdk5FODNLWTgw?=
 =?utf-8?B?Y2FXM0ZMRklNWXYxK01wM09OUDJkV1IvWUc3SEQzZWd3c0cxK1JWeTBBd3Z3?=
 =?utf-8?B?akREdGhHeXVNdHR0eHFyZlhLTWVlcjhTWnhvMlBpWVJwSnN3ZnRMRWdYWFMw?=
 =?utf-8?B?TVhYSU5yQ3MxUVNTeTdMVkFqcnF0ZHdFZC96RWF0N0hWQjNvcWZZV1V4K01C?=
 =?utf-8?B?aTZWWFkwdFlzcnU1ZVoyTXlxS1pyMzhwTUhvUHQ5dTBQK3hLVENmM3lpV2U5?=
 =?utf-8?B?V0E5cnZXcElHTU5ETVpxSC90SUZjTzY3MEM2WXN5NURVbW1xV3JDQUppajcz?=
 =?utf-8?Q?a74GI4YGJRDqdlKosp2C+s5FryI4JSEx93ND0ImMLI=3D?=
Content-ID: <EE3AEA617756544783FC301F4B3E07CB@FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a8f478-a30c-4d83-901c-08d9e6e3d38d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 07:07:23.0089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xdlSuDej9rslhaHurHQN+UrTTRSV5eizg8UdeyRZGai4Gdc/LKQXTUO1fr7Z0zMXLtEKh0zXEMMsAQPuhZKumFZu5CIxgjDhuNZWHVBQoRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2731
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Le 03/02/2022 à 06:39, Michael Ellerman a écrit : > Luis
    Chamberlain <mcgrof@kernel.org> writes: >> On Thu, Jan 27, 2022 at 11:28:12AM
    +0000, Christophe Leroy wrote: >>> book3s/32 and 8xx have a se [...] 
 
 Content analysis details:   (-2.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.9.85 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [40.107.9.85 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nFWDK-00ETak-Lu
Subject: Re: [Kgdb-bugreport] [PATCH v2 5/5] powerpc: Select
 ARCH_WANTS_MODULES_DATA_IN_VMALLOC on book3s/32 and 8xx
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
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

DQoNCkxlIDAzLzAyLzIwMjIgw6AgMDY6MzksIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gTHVpcyBDaGFtYmVybGFpbiA8bWNncm9mQGtlcm5lbC5vcmc+IHdyaXRlczoNCj4+IE9uIFRo
dSwgSmFuIDI3LCAyMDIyIGF0IDExOjI4OjEyQU0gKzAwMDAsIENocmlzdG9waGUgTGVyb3kgd3Jv
dGU6DQo+Pj4gYm9vazNzLzMyIGFuZCA4eHggaGF2ZSBhIHNlcGFyYXRlIGFyZWEgZm9yIGFsbG9j
YXRpbmcgbW9kdWxlcywNCj4+PiBkZWZpbmVkIGJ5IE1PRFVMRVNfVkFERFIgLyBNT0RVTEVTX0VO
RC4NCj4+Pg0KPj4+IE9uIGJvb2szcy8zMiwgaXQgaXMgbm90IHBvc3NpYmxlIHRvIHByb3RlY3Qg
YWdhaW5zdCBleGVjdXRpb24NCj4+PiBvbiBhIHBhZ2UgYmFzaXMuIEEgZnVsbCAyNTZNIHNlZ21l
bnQgaXMgZWl0aGVyIEV4ZWMgb3IgTm9FeGVjLg0KPj4+IFRoZSBtb2R1bGUgYXJlYSBpcyBpbiBh
biBFeGVjIHNlZ21lbnQgd2hpbGUgdm1hbGxvYyBhcmVhIGlzDQo+Pj4gaW4gYSBOb0V4ZWMgc2Vn
bWVudC4NCj4+Pg0KPj4+IEluIG9yZGVyIHRvIHByb3RlY3QgbW9kdWxlIGRhdGEgYWdhaW5zdCBl
eGVjdXRpb24sIHNlbGVjdA0KPj4+IEFSQ0hfV0FOVFNfTU9EVUxFU19EQVRBX0lOX1ZNQUxMT0Mu
DQo+Pj4NCj4+PiBGb3IgdGhlIDh4eCAoYW5kIHBvc3NpYmx5IG90aGVyIDMyIGJpdHMgcGxhdGZv
cm0gaW4gdGhlIGZ1dHVyZSksDQo+Pj4gdGhlcmUgaXMgbm8gc3VjaCBjb25zdHJhaW50IG9uIEV4
ZWMvTm9FeGVjIHByb3RlY3Rpb24sIGhvd2V2ZXINCj4+PiB0aGVyZSBpcyBhIGNyaXRpY2FsIGRp
c3RhbmNlIGJldHdlZW4ga2VybmVsIGZ1bmN0aW9ucyBhbmQgY2FsbGVycw0KPj4+IHRoYXQgbmVl
ZHMgdG8gcmVtYWluIGJlbG93IDMyTWJ5dGVzIGluIG9yZGVyIHRvIGF2b2lkIGNvc3RseQ0KPj4+
IHRyYW1wb2xpbmVzLiBCeSBhbGxvY2F0aW5nIGRhdGEgb3V0c2lkZSBvZiBtb2R1bGUgYXJlYSwg
d2UNCj4+PiBpbmNyZWFzZSB0aGUgY2hhbmNlIGZvciBtb2R1bGUgdGV4dCB0byByZW1haW4gd2l0
aGluIGFjY2VwdGFibGUNCj4+PiBkaXN0YW5jZSBmcm9tIGtlcm5lbCBjb3JlIHRleHQuDQo+Pj4N
Cj4+PiBTbyBzZWxlY3QgQVJDSF9XQU5UU19NT0RVTEVTX0RBVEFfSU5fVk1BTExPQyBmb3IgOHh4
IGFzIHdlbGwuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+Pj4gQ2M6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBl
bGxlcm1hbi5pZC5hdT4NCj4+PiBDYzogQmVuamFtaW4gSGVycmVuc2NobWlkdCA8YmVuaEBrZXJu
ZWwuY3Jhc2hpbmcub3JnPg0KPj4+IENjOiBQYXVsIE1hY2tlcnJhcyA8cGF1bHVzQHNhbWJhLm9y
Zz4NCj4+DQo+PiBDYyBsaXN0IGZpcnN0IGFuZCB0aGVuIHRoZSBTT0IuDQo+IA0KPiBKdXN0IGRl
bGV0ZSB0aGUgQ2M6IGxpc3QsIGl0J3MgbWVhbmluZ2xlc3MuDQo+IA0KDQpXYXMgYW4gZWFzeSB3
YXkgdG8gY29weSB5b3UgYXV0b21hdGljYWxseSB3aXRoICdnaXQgc2VuZC1lbWFpbCcsIGJ1dCAN
CmdldHRpbmcgaXQgdGhyb3VnaCBsaW51eHBwYy1kZXYgbGlzdCBpcyBlbm91Z2ggSSBndWVzcyA/
DQoNCkNocmlzdG9waGUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9rZ2RiLWJ1Z3JlcG9ydAo=
