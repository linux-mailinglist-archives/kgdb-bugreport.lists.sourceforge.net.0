Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD04349ABD4
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 25 Jan 2022 06:44:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nCEch-0002AZ-3i
	for lists+kgdb-bugreport@lfdr.de; Tue, 25 Jan 2022 05:44:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <christophe.leroy@csgroup.eu>) id 1nCEcg-0002AS-8L
 for kgdb-bugreport@lists.sourceforge.net; Tue, 25 Jan 2022 05:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3xHZ3veQ+YtWM/T4+jKKzmvsABXGqIbjfJtLd3FDaCU=; b=CoL48JIch+l1lvzDweUshYOaNx
 1UJBhqNvWEvCtFMGl/97dYAuTZhIQH/pz3IJfnEZJj26kb1m2MKNOnz3nBAYp+B7JF6UZLLalduAI
 9mDh+5Kp1OMAMhojPBWJukDNp5qtoa99Esnp+pPYfAJsH/0B/VaLJzFc5h2z0NMuPTys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3xHZ3veQ+YtWM/T4+jKKzmvsABXGqIbjfJtLd3FDaCU=; b=NUTjOWl1d0OiEKCR+nnD+eYejU
 00uIsCjm1Fy/MQk8NNKR4OTXZs08J1S+DFVV8+8m9erjPhBcEnJmT3R3PHUKyCf7dfQbl8K8+sN9b
 9pFCyO3dQxG/S7DuGwegKLUHHQu1INs6Qy35hqwv1/HAYri+TUjjCgCsCi2wln+YhCeg=;
Received: from mail-eopbgr120042.outbound.protection.outlook.com
 ([40.107.12.42] helo=FRA01-PR2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nCEca-0006hD-Nx
 for kgdb-bugreport@lists.sourceforge.net; Tue, 25 Jan 2022 05:44:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjp3uJnzDaxsl9TciNz9w4HEX/zwh1CPiFRQN6vXiv6K7njqWFqMC5lrd+4aE5TeT3fDVfszsABpeptG4Blt8SIguxLA6gOMSGMNQ5tlJDgeJ8ojNzQ2k+TNqjsTJqRxXEmiXDI4t690MGh20mU8pydNBaeCGF4GCdtCNcyQ7xFpkjNmJxTn7r9cPldexUCmis8HbZBWlfeQJMQPx0JMzFpTNWEAePZCm1vxliHHKDSV8xSJwTD01riCmesif680vXyRmGdfSBaDTTSAvA5O9zbnTbGEsIT0wAcoDnLqBWiHbmYvtGFrTdLuEdBHGh4Oh+E7Mh9led7bUWrcU3pLCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xHZ3veQ+YtWM/T4+jKKzmvsABXGqIbjfJtLd3FDaCU=;
 b=Qexvi4mSh3dk2F0qr9NwrRhZhcclFiUX+H3/bzJW7Ik9cFD4IhB0qXfnU8l2Z0A24BBEGkquaAzXtN50ps/Suykq45++TJiiYcZ+8PEyiccyQEBGaB/yRCAZAxETf7JZD/3TEm5ifRPFBPrq6+pz1MCNkJNAPykEbDfejbzQk/cUooIVS4kcCLndJuruIkn7UFG/AdJ5ZGmrJbzaXvbbeoZsBfnlj64Q6abO1q5TBS2Kv+s8UzerltWGVoujhJAA58kgD2G5nCVk5POmXWbahDyak63cl6k2Zs1sibRm8hPuFFPrGCZobPqkKNqBiwyDSjadZjYGZ8v3sTsIkIJm1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB4159.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 25 Jan
 2022 05:43:51 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 05:43:51 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Doug Anderson <dianders@chromium.org>
Thread-Topic: [PATCH 6/7] modules: Add
 CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
Thread-Index: AQHYEQPri54wm9k2kUic7oR3m4zr7qxytLYAgACGUAA=
Date: Tue, 25 Jan 2022 05:43:51 +0000
Message-ID: <ab62ef39-b4a0-4b8e-5fcc-1d47fa559431@csgroup.eu>
References: <cover.1643015752.git.christophe.leroy@csgroup.eu>
 <848d857871f457f4df37e80fad468d615b237c24.1643015752.git.christophe.leroy@csgroup.eu>
 <CAD=FV=VMUA+8RFOSkVQTmBDrHPSYSG5VBVA_EKKQuBjF0ZZKpQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VMUA+8RFOSkVQTmBDrHPSYSG5VBVA_EKKQuBjF0ZZKpQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 070e794e-cf14-4041-ffef-08d9dfc5aa8a
x-ms-traffictypediagnostic: PAYP264MB4159:EE_
x-microsoft-antispam-prvs: <PAYP264MB415971DABA98F6DA0C0E5AC6ED5F9@PAYP264MB4159.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OHCpK9MDdAWdVd58qGGjyGB2F+pJyJ6MlnQhwf2Waxh+5qOncjtk0JdJ6Cf9H+gufiNqwYEb7MdQmfin41XkIWnBE3bbGH8DG8HMGtJFymDaCpd008jOrfJ3FzPBvsBOgSoWXl3oACMHw5fNN0cXGQ9HXeCYE3x7pcNaaeHHsPuUKMnRF6P/qXpaLfaIpMkwdiRGl9iH6IgQ/ResiRRBA3R3I3Q7FvfImPXfLv3zjwfBBQ1qJ1ELpeTQyqZN5HrdxGzYfHWI/+VVGEC2yXCEvqNZ6pfL4iaUaQyCsPaq/oySI/9xWY6KX4qkUIH3SslfaU9zM/CheTqrxSnoPQIW/J8KASaOXUegZyd5mUwewOXjDpdT1OqtyYblAaIz6hCPFxbQ2paaI5XttR5uyAScmLHINYrB2mhnjFPlZRTNQWKcu0Gnu38XgDqfPW1lPs05otwG7J243IBE/Rb19v4ABQLWQfptIo20EbmawTFTwxWOZphwUkUfG9/A0opuDg1FQ9X6BTEC0v1Df1IAqMZIgIy7Ue0eir4nDiWjW9hNEK8zcrfyT7/V/ttm/JZNj97boDDmsbKWRPqL8fwsFXHgizoCWNYiuLBC0N/GwuCMb9Dew2JvTfyOVN8JSBKxDLJaLDb3pAOgBLEvXrjSshAPTlfv9jgfiACtwOvLbr3aaM6z0u/0n830RdaIXXiek+MtEA+rH86l7bPFJB7j3LQpEA4RJeQminVB8vn4jB6sig9T+0yHq3yhfBc+B3WK26hsYwJ1cxC/HVC3dZmQNlpUdg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(186003)(6512007)(6486002)(5660300002)(38100700002)(26005)(31696002)(4326008)(8936002)(6916009)(7416002)(53546011)(54906003)(6506007)(2616005)(71200400001)(66556008)(38070700005)(316002)(508600001)(91956017)(66446008)(4744005)(64756008)(44832011)(66476007)(31686004)(36756003)(8676002)(76116006)(2906002)(86362001)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QS9yVjR4RG9rNTREQ1l6Nm9IZU8xRUlwU2w2ZWFsRGMxL2dxRnFsZVZvQjVM?=
 =?utf-8?B?c1pvejBRYStPVVdJakxHdTNyY1Z0V3IzWW82WnRaRmRtQVpPbjJRd2RtK01j?=
 =?utf-8?B?clUyR1AveXlxL2JsNDAvTDQ5QTZKMTBiejJadW5nYmJJbUlPZ25FUFR2QnVn?=
 =?utf-8?B?RXUwRFdKdTBZbis4TktWUTZDSTgzUWlHMGphVjZnWW92ek42em92cTkwVFJG?=
 =?utf-8?B?MTNXK2JHaTNBUnlnY3F5bGpXYTBHU0M3NER2UWRsK2pVdzNvNTd3cUE0QXpl?=
 =?utf-8?B?SUt2WWxlNjg3czFjb1VOZk9iSUNNYjNmMnVoY3NsY2xwZTUvYkJLVGZtYmNa?=
 =?utf-8?B?OUhXSEt3MnVGNjBaNERLY25SSVBGSEd2WGRBbWFTc1BZNW1kcEtuSWFZMjk0?=
 =?utf-8?B?SEZueFcrQmR1dlVFU1Jvb1BwY3lQZnlNazRBVzk0OUdrOEY1SGVUNFNhZWR3?=
 =?utf-8?B?N3BxWkFlNURITUtoc2toZy9hMnUxaFhXMVFvUmxaaTRWZHV1aFZoQkdybUhU?=
 =?utf-8?B?RnBpOFk4V3IzZTdhTFFxMFRjKzUxS3ZoUEJKczFkMHJMdkJhQXkvYm1mODZO?=
 =?utf-8?B?ekFyMWU5ZWM1U21PMzFYb0I5ZnFWbzBCSnJiQzNFS2FiT1hBOFY1WE92Zjh5?=
 =?utf-8?B?bXo5L0VnaVdzWldEVENDNW4ydTBpNDZTbXAwR0liNC9Ka3VJL0FZY3k5SFR0?=
 =?utf-8?B?dklGY1VNZjhhV2xnQm1DWEgwaGdUQW9oN29yb3NRajFWVGJnZkRaY21paTJn?=
 =?utf-8?B?OVg4S0NxaVZ5MkpaL2krM3dabG9NemlMK016a1BrUThYWjd1SGtiekZ5bUpx?=
 =?utf-8?B?YW9DTUV0YmtJVUZXVzZlcWcyMmx3VTRRKzhFQlN3RDlQVkZ0T3pkUFBaa1lp?=
 =?utf-8?B?VXdIUXQ1U0RGaXlPYVlWUTlKMW40U01vSk0zYSs0ZkpoSmxUaHNqbzl2ZWZY?=
 =?utf-8?B?YkpjVXpuVk54NEc1RVVHNEJIaVFmaTZweWdRYUtvWXNMNXNSczNOQWY3eXNn?=
 =?utf-8?B?R2toK1Y5dThmWi9YT0NGTVd1ODJDTnEvazB5b1QzOWtESm1pVGNlVC83Tnk2?=
 =?utf-8?B?SUdSL3JMRU9OTXFudGQ1cEd6SWduRzgyT0hNRGozNFNqU0lDRXVzRGFBRVRy?=
 =?utf-8?B?UzhDQUY1Rm1zczc5d3ZxK0EwNEVmSk5uZkhwYzdyYUx2YlhLSFl3SmdJa1Uw?=
 =?utf-8?B?RVRQdFcwZ2VkS0lOM3dWNmNYamFhQUg4ektvYkZuV085UmRZY3dmTjFiS2tk?=
 =?utf-8?B?TUc2LzRnZG5xR3VyWkJSa1FTVTRJS1hnNFNReTBIZTJDK3BaM2hSSnlZOFUy?=
 =?utf-8?B?eTdaMW1VSVBaUlIrNXZwMkdCK1RBY09zVS9mcHFTeDMxeEJMQnRnc2prelVM?=
 =?utf-8?B?VVFqSGhTb1JrcW5tQkVibXc1emlUWWRIdWdTR1Q0Tlc2RXBFRHdxYTJEQ08w?=
 =?utf-8?B?NDQ4a0locW9CTVR4WHE5RkpacWJhcWY1eTNoL2VVRTRYTjRMU01PYjRpV2Ju?=
 =?utf-8?B?MjJFQVpVNWRyelh5NHgwMVg4VkowL2ZraTFKdGlQQ3B5YkZHbE1YTytjdGJy?=
 =?utf-8?B?ZFozUW1EWTF2Z1ErbnBJTDUrSXU1bFdKQU03RFlIby9HMitIR2RFMC92cDdJ?=
 =?utf-8?B?Q2VTWk83WC9tZDRHY0xSRG1IRVNpZlVpZVhoVnNzQWg4TlBud1F6VnVmajlz?=
 =?utf-8?B?UFAybk4yNzZkUC9pNGtqVGdvRWp1UDRUNFVmeEppVE5BejVDWXdxUnlINDRF?=
 =?utf-8?B?UXRWRTREKzJNT0hXQ1J0RGlYR2FaWW9leXZWN1E5RWFjSjlJTTZPY3BqdEJx?=
 =?utf-8?B?QWVsTUk1Z0diYlFsTU16aU55cVFEUHhiS2wwSzhqbyswdUFBOFo3VUM4YzBV?=
 =?utf-8?B?Zm5YeGROVlVxbG15dUY5cm8wV0gwS2NXcktjY0NaZE1MY1AyMnk1TTlCVmZa?=
 =?utf-8?B?UGs3cVNDM3loVjR1azhGZUZ5dHFLcTh2L0NwQXBuZEV2dElTOWRYSzlYcmpL?=
 =?utf-8?B?OUdncUVRdyt0UklabDgxa1FRd3ZNWFpEK3luTWpUVzlnYjF2UjVSeERrSjBM?=
 =?utf-8?B?M2tVZGF4aWM5TzgwZ0VaZUJYdnFKZmo3Z2JJOENQNytMUExqSXlKZjhmUUND?=
 =?utf-8?B?ZzJIM0Y4WEhUTitERTNaVlhhRGFkbU5sK2wzbUpvaDV3NWhZSmZBYlh2V3Bo?=
 =?utf-8?B?K2dmWkIweG1KWTUzUHhjQlRhRnNmMVZwUVc4NE92OHVEczM0WXU0bHBGUzFF?=
 =?utf-8?Q?uwxujOMwyNsXtvGykcsUt9Y/J43ib7ZNfc3oWa64DI=3D?=
Content-ID: <FBA3389B97E4FA4F89913B4877DFFEA8@FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 070e794e-cf14-4041-ffef-08d9dfc5aa8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2022 05:43:51.1485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QM1yMdi4SQVzmFB+LrrKsJ6AfZnq46SRk8PwDByAfXV0mOdw8W0O5HcyQrzkDaNRnvwlImu7OvV/ILuazBFhXv/Momb+PFOmQKSAHc31oto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB4159
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Le 24/01/2022 à 22:43, Doug Anderson a écrit : > Hi, >
   > On Mon, Jan 24, 2022 at 1:22 AM Christophe Leroy > <christophe.leroy@csgroup.eu>
    wrote: >> >> --- a/kernel/debug/kdb/kdb_main.c >> +++ b/ker [...] 
 
 Content analysis details:   (-2.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [40.107.12.42 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.12.42 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nCEca-0006hD-Nx
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

DQoNCkxlIDI0LzAxLzIwMjIgw6AgMjI6NDMsIERvdWcgQW5kZXJzb24gYSDDqWNyaXTCoDoNCj4g
SGksDQo+IA0KPiBPbiBNb24sIEphbiAyNCwgMjAyMiBhdCAxOjIyIEFNIENocmlzdG9waGUgTGVy
b3kNCj4gPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6DQo+Pg0KPj4gLS0tIGEv
a2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jDQo+PiArKysgYi9rZXJuZWwvZGVidWcva2RiL2tk
Yl9tYWluLmMNCj4+IEBAIC0yMDIyLDggKzIwMjIsMTEgQEAgc3RhdGljIGludCBrZGJfbHNtb2Qo
aW50IGFyZ2MsIGNvbnN0IGNoYXIgKiphcmd2KQ0KPj4gICAgICAgICAgICAgICAgICBpZiAobW9k
LT5zdGF0ZSA9PSBNT0RVTEVfU1RBVEVfVU5GT1JNRUQpDQo+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29udGludWU7DQo+Pg0KPj4gLSAgICAgICAgICAgICAgIGtkYl9wcmludGYoIiUtMjBz
JTh1ICAweCVweCAiLCBtb2QtPm5hbWUsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICBt
b2QtPmNvcmVfbGF5b3V0LnNpemUsICh2b2lkICopbW9kKTsNCj4+ICsgICAgICAgICAgICAgICBr
ZGJfcHJpbnRmKCIlLTIwcyU4dSIsIG1vZC0+bmFtZSwgbW9kLT5jb3JlX2xheW91dC5zaXplKTsN
Cj4+ICsjaWZkZWYgQ09ORklHX0FSQ0hfV0FOVFNfTU9EVUxFU19EQVRBX0lOX1ZNQUxMT0MNCj4+
ICsgICAgICAgICAgICAgICBrZGJfcHJpbnRmKCIvJTh1ICAweCVweCAiLCBtb2QtPmRhdGFfbGF5
b3V0LnNpemUpOw0KPiANCj4gSnVzdCBjb3VudGluZyBwZXJjZW50YWdlcyBhbmQgYXJndW1lbnRz
LCBpdCBzZWVtcyBsaWtlIHNvbWV0aGluZydzDQo+IHdyb25nIGluIHRoZSBhYm92ZSBwcmludCBz
dGF0ZW1lbnQuDQo+IA0KDQpZZXMgaXQgc2VlbXMsIHRoZSBidWlsZCByb2JvdCByZXBvcnRlZCBz
b21ldGhpbmcgaGVyZSBhcyB3ZWxsLg0KDQpUaGFua3MNCkNocmlzdG9waGUKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGlu
ZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
