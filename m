Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 248F8345086
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Mar 2021 21:15:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lOQxb-0005Z4-V9
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Mar 2021 20:15:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jason.wessel@windriver.com>) id 1lOQxC-0005V8-Gr
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 20:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:Date:Message-ID:Subject:From:References:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VDzdwOrUxzFM4lKePkZubAT4Asc4TRuSL4bAnOFqdrM=; b=A+zQbsG8yHL0kHm+Vd+JZ5G/xI
 9ESDrF4znimlOg+xmh3bZpcta+6ocmAWb6o8vZjfUUWOYt2XCxtQV6ZjlN9JCNQx7DraWtD15hJK4
 AYN+64ecEo6uJD9I4A4QZxenYTd9egSU9ucGTaxT2ZgYbBIS7ikhqbI0DY/K02s/svgs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:Date:
 Message-ID:Subject:From:References:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VDzdwOrUxzFM4lKePkZubAT4Asc4TRuSL4bAnOFqdrM=; b=Gh/hvBvrILzHWh7YUcZbdmZyYA
 yDI7UBR45VWdpbc+Zox/LmEyj1kIppjwRHAFrH8no3i7SEsYJjDg9zgpMvgqo2DCrcf97sbK3VeEd
 YoRoH3MNBiGv+9EGwtDKqKs41cXmpgL1kxhqTKGmauwcul350xyYYri6YMYXk6DM8mHg=;
Received: from mail-bn7nam10on2068.outbound.protection.outlook.com
 ([40.107.92.68] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lOQx1-00FaEo-La
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 20:15:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvMfuXpEaQxFHRwEg2f9B631v3JJq6up5OCq0zHaKiQnpJYidiuUJDwED7Q8uzgwtcT6qu+Z0p23ciw/xGuTxgcFKAuInnlY2raerkdeAm1HnbN2wZaYKeY50Dxj1uhMyCGXxS3T7L/ZG6neVCqzSVdFCvXTtaSONtGCvmy0Lrsh8Pd/Vzpv11dJbpG3AHxfHa433AnsiWppH62IXmdborBwaI0bqVjof3OYPTl4CpSzL+Xtf6LMkxzpMKp9p2X8SxBaCXo1x/fLUwNLhUFkr1FaF/fC//gwji0Qtqo6D9Fm/xECCWsxlfkEsx1RdwC6JrZCiN/paCyINkTERzN/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDzdwOrUxzFM4lKePkZubAT4Asc4TRuSL4bAnOFqdrM=;
 b=Jj/KFpobpVlYXI3qMbQKS4JBkkajUIPlG0olUodU2UHPFmvXOiIbl0jJ3iiOK53YNqNhvF0rIivq2+jBA1xzn+ieha+cFVbDAo159Ah4rKpYUt8Ny7Nw1rbN3HyK+7Kx4bt2fQGd0Pa8ouO0PPyG0F5aQjlVzNmQ1J9WA3WPN5nBIcX7vXZV4IvsyHqPa0MEXsjSrAV5aQnuwjgB7hBPNAlIhN94tItqn26lTJfzuT7XC6U8kejL59GpJrPJOMIC+a8q9NsZ6dBIRPZvJjZcbNBK2n0NRBTc3HizIhprVoPCaEAJQxNfqOvWAv6qXOLJONem+9MjlIY0RA3b/Y0otA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDzdwOrUxzFM4lKePkZubAT4Asc4TRuSL4bAnOFqdrM=;
 b=TwH/P09nIYKgFp6P5nKLl/YDtCebKidiYU3xAMacoh9+Q5UT6gOqi89fITHpttduJTXnCO1q43Pn7okg12+fWVUok5ATUsPXts9sRoLzzJtBlG3pV2BCVTu4v+vi1HEulSZVVVKQwvTtCfqJlyqGWxhD3Hs8+Puo16s0RDyX5D0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB4511.namprd11.prod.outlook.com (2603:10b6:208:189::18)
 by MN2PR11MB4223.namprd11.prod.outlook.com (2603:10b6:208:18a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 20:14:50 +0000
Received: from MN2PR11MB4511.namprd11.prod.outlook.com
 ([fe80::911c:4681:cafd:6f56]) by MN2PR11MB4511.namprd11.prod.outlook.com
 ([fe80::911c:4681:cafd:6f56%4]) with mapi id 15.20.3933.032; Mon, 22 Mar 2021
 20:14:50 +0000
To: Doug Anderson <dianders@chromium.org>, Arnd Bergmann <arnd@kernel.org>
References: <20210322164308.827846-1-arnd@kernel.org>
 <CAD=FV=WY6yxx+vkH+UU4VYei29xBftdnyRBE1OpEELmJ-kLfFg@mail.gmail.com>
 <CAK8P3a33qv79GedMCwA=GFBWYCMB2fYrq2QmGpN3TWfqgg8j2A@mail.gmail.com>
 <CAD=FV=WaOFJEnZ=b+UTaTXDWMs8JOeBw1gRFYrtSJK-+CXGPyw@mail.gmail.com>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <1bdabbff-8e3f-60dd-145d-af2dc45c1da5@windriver.com>
Date: Mon, 22 Mar 2021 15:14:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAD=FV=WaOFJEnZ=b+UTaTXDWMs8JOeBw1gRFYrtSJK-+CXGPyw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [73.74.120.8]
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To MN2PR11MB4511.namprd11.prod.outlook.com
 (2603:10b6:208:189::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.0.2.15] (73.74.120.8) by
 SJ0PR03CA0116.namprd03.prod.outlook.com (2603:10b6:a03:333::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 20:14:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a7496b3-20ca-4ba5-37e8-08d8ed6f25d1
X-MS-TrafficTypeDiagnostic: MN2PR11MB4223:
X-Microsoft-Antispam-PRVS: <MN2PR11MB422395BFDC6858FB5D7CB74D97659@MN2PR11MB4223.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PmtT95BocNEJ3QpNIxporOS1sU7gzylUgSFhwewS57L34pUIA9xRvS0nud2pPaMLYdnOJ2BgNT38r8296Umks7baNq4SeIEXmNKmUwD17L+TMJYPT8Zb8PicOznkySJqm6SXR261GLUgP8zqp8J40BYaXT5cisevBnxUXPWb4/1LUS/+sjeywNJmEpUtn8IMAiR/WIwjTTh2Sy5AG1XNu9Wpo3YHIiWzEZbVB1DvUO3mQaDsjZ1PsJA4XYW7RgRnU5YhmvT80uqH1ti+kOk4vm+9vvWqzaT62n7vGGU8K1m6fv6Dx+hSHxLo/zcNS3H2FaVbnFadF+R7OKKy4lMKQkRTLcGC9BVPPPfg6XVozD5bkkR6ZMgCCdKMcIWe24p37aAr/kA9JtDJTWKIB/YqkreV1UVlSYXi+spaSFd73kWCkhgEpc1vA2KvP4piup4cQVmz9oICwH2uOTnWlPwVYGnsu5NKNzQEzR+HwOJEgPn6o828uqucCjOGkpmBrhAzpaS6jf6z1jzpukevdTqRDT1k+Y0A5wScj8YIWRAp69n2QDO/wt9g3QZDh6ZCedhiYPpuXBb2SuR0Aqt4b1rSwJEG6/iMy3XhGlop72RnQ4CdhsfWymvRb3LinoNFfUGbPCR5qtrL2c15MVBKGC7lbZmDW/ghubmRltiGRDBU9wKASagILZTaAvPduaxNYyzaf+a4k2DQdFHAsFmHYzMhwIO2KlLplK+b6xQdgZu7xhg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4511.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(136003)(39850400004)(366004)(956004)(2616005)(8936002)(31686004)(8676002)(16576012)(83380400001)(316002)(53546011)(5660300002)(36756003)(6666004)(16526019)(186003)(44832011)(26005)(110136005)(38100700001)(6486002)(66556008)(2906002)(478600001)(66476007)(54906003)(31696002)(86362001)(66946007)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U2JJWDJpVFFNZDMvdnM5UDZBeTJmbzV6QW1ySHJoWmVQTVhLL0xNZ3BHMDY2?=
 =?utf-8?B?YmtKRElHemhwdnlTRmR6SVJOOS9kYjZGZ1hkcDNmcnFZOHUxSWtZYWxtWlE3?=
 =?utf-8?B?R0RPVWkwN3RwWEp3b3FDd3VvUVpHNkpxaVphTHR3WDZmbnZSd3FialJwVUJ4?=
 =?utf-8?B?cy9PTFNEMU04RWdnb1Y4emVkQWpoNGFJa2pRa1NMdmFOQzZQaXlwa1FWcU5Q?=
 =?utf-8?B?aFBhVlBVL0hwaTlIaEs2K2Fib05aYVE3VGEzOTFzeXZHNHBPTC9ZdWFqUnFO?=
 =?utf-8?B?NGdBUXRKVjdKNjdHU2xUQTlxQmhXTmxaVEk0SHhwQlBtWVV4NHlYY3gwM0Mx?=
 =?utf-8?B?OVNtRitOTGl6akFwbFh0ZVZkTE5KRnFYbzJlOCtXTVI2M3UvSGFhRi95QWlS?=
 =?utf-8?B?L1RIem5NTklSanJwTlBqNnIrM0lyVklaektyQXBaSmh4eTBIaER0Tmpha25l?=
 =?utf-8?B?c0s4emFLMlFLWlpjYnd2ZGU2b1Qrb2FLZU1SWWFsdVRZcEFmSzF2S1AwMDVB?=
 =?utf-8?B?U3RBdnJ6VXM0TW13ZVZ5R0hTVGJoNkRoOUw5MFZIK2FvT1E5aUY5U2QyZ2ZN?=
 =?utf-8?B?d2tCMmxjMHhnSmlHMkQzZ1ZTM3JOZDNUMVVOUWtjdjEyRUVFZnJOZ3dBZ0tC?=
 =?utf-8?B?UzZjTk1HYzIwYmZmUituMUE4RmYrS2RiVXBIWlhVeFFyY0c3dG00VHEyZUZm?=
 =?utf-8?B?WG1aeDlmMisrWm52L0RTV29FZldrNFFKQVVyQlZqTVlaTnd0N3RZRjkvY0FV?=
 =?utf-8?B?VXJaRVpoMUpiZEhObHMwcld0UkE3ZDhiemJoNEgyOFk3TUgzb21ERzFLWXky?=
 =?utf-8?B?TTdBSzZmWHpHZWdrTi9DZXA0UmRQTkptMFFvN2VlczYwNjE4QXFJM3l0VWs1?=
 =?utf-8?B?aUljQ1R5ZklrbDNCcmRHOTYxcHhyeERzMWJsM3c3U2Z4S2o5SW1KUE1ZSUE5?=
 =?utf-8?B?bnlDdjFOUTVGakZ6d2s1NjdweUEyVy9RU3RaMnBiQ2pxT2dZamxMdFdiU2d0?=
 =?utf-8?B?dVF4ZGxlaW8yRFhrcTRDdC9aOWpyckVZeERqeHV1QzA2MUgyaHVxL1hJYzRF?=
 =?utf-8?B?Q0xxeDZvQjNuUHRtNzRSVXd0Y2hiU085cExSeFRGSFAzTFdVblZhMmlibnFQ?=
 =?utf-8?B?d2QzcTBLT1hjY01ES2JQNjh6emJwTXNEUFI5cmVlWWd5SmF2b0Q2VVNJeWRt?=
 =?utf-8?B?eW1xZzZZbkY0c2h5SDZrRWlEei8yUXZaaEpZdXNSazdxYjFIVFgxOHJLQVdK?=
 =?utf-8?B?NWdWMkZLUVNvSzZINXpmYVJUUjZaYlBqeE5xRGlsbjFtNEFSMjN1L0xIYXJR?=
 =?utf-8?B?WEo4YmVjblcyRExPaEltb0s5Z2VYdER6bkpWQTBPNCsvR0pVNXMwTmk4UW1a?=
 =?utf-8?B?OVMyblBVcmFTc1lCYlc3TkZEMUcxV1habTJzb2ZIOHhoM2xEN3k4QVYxbUFz?=
 =?utf-8?B?MDZpZzhKNm9ReStMZ0RjeXdNOXRXZXVyVmJlNGdOM0k1Y3czdlJ6QTRrVExs?=
 =?utf-8?B?dFJuNDNJMkZXR3krWGtlT0l6SzlwOGI0TTVQZ09WNXArM2xIcFN1R0ZXY1BP?=
 =?utf-8?B?a0RPMmlXeFI5aUNzUEd0NWFrSk95SnJDbDVNQi9wcnM3UWsxdVhXQ3pVaUJo?=
 =?utf-8?B?ZHVDWFhFcUZnTDVnM3JiVGsyZS9jcldJbG9KSTQrYjlhdjBkMW1IM2xJSWZO?=
 =?utf-8?B?V1VMa1lxOW91VzNNdDJkNWRsdjJWQmNaYkY0MFVhSmZPeklmYUZsc0YzU0lx?=
 =?utf-8?Q?7+iAJVE97JB4LMtBT8A1vl0Hk3z9oKeDTIG0jGF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7496b3-20ca-4ba5-37e8-08d8ed6f25d1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4511.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 20:14:50.7774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Yqh0r5+BSvOFqLf7T4YaJC35qSwHzUNTBz45Bb/5yXJi7egZOHdlGGiCKuDnEqCngJETdsmnr2vYcscfzGRrJG9L+jHlTph15WprC3xFN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4223
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.92.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [40.107.92.68 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lOQx1-00FaEo-La
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: fix gcc-11 warning on indentation
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, kgdb-bugreport@lists.sourceforge.net,
 Ingo Molnar <mingo@elte.hu>, Christian Brauner <christian.brauner@ubuntu.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net



On 3/22/21 2:22 PM, Doug Anderson wrote:
> Hi,
> 
> On Mon, Mar 22, 2021 at 11:19 AM Arnd Bergmann <arnd@kernel.org> wrote:
>>
>> On Mon, Mar 22, 2021 at 6:07 PM Doug Anderson <dianders@chromium.org> wrote:
>>> On Mon, Mar 22, 2021 at 9:43 AM Arnd Bergmann <arnd@kernel.org> wrote:
>>>>
>>>> -#define v1printk(a...) do { \
>>>> -       if (verbose) \
>>>> -               printk(KERN_INFO a); \
>>>> -       } while (0)
>>>> -#define v2printk(a...) do { \
>>>> -       if (verbose > 1) \
>>>> -               printk(KERN_INFO a); \
>>>> -               touch_nmi_watchdog();   \
>>>> -       } while (0)
>>>> -#define eprintk(a...) do { \
>>>> -               printk(KERN_ERR a); \
>>>> -               WARN_ON(1); \
>>>> -       } while (0)
>>>> +#define v1printk(a...) do {            \
>>>
>>> nit: In addition to the indentation change you're also lining up the
>>> backslashes. Is that just personal preference, or is there some
>>> official recommendation in the kernel? I don't really have a strong
>>> opinion either way (IMO each style has its advantages).
>>
>> I don't think there is an official recommendation, I just think the
>> style is more common, and it helped my figure out what the
>> indentation should look like in this case.
> 
> OK, makes sense. I just wasn't sure if there was some standard that I
> wasn't aware of. Given that you have to touch all these lines anyway
> then making them all pretty like this seems fine to me.
> 
> 
>>>> +       if (verbose)                    \
>>>> +               printk(KERN_INFO a);    \
>>>> +} while (0)
>>>> +#define v2printk(a...) do {            \
>>>> +       if (verbose > 1)                \
>>>> +               printk(KERN_INFO a);    \
>>>> +       touch_nmi_watchdog();           \
>>>
>>> This touch_nmi_watchdog() is pretty wonky. I guess maybe the
>>> assumption is that the "verbose level 2" prints are so chatty that the
>>> printing might prevent us from touching the NMI watchdog in the way
>>> that we normally do and thus we need an extra one here?
>>>
>>> ...but, in that case, I think the old code was _wrong_ and that the
>>> intention was that the touch_nmi_watchdog() should only be if "verose
>>>> 1" as the indentation implied. There doesn't feel like a reason to
>>> touch the watchdog if we're not doing anything slow.
>>
>> No idea. It was like this in Jason's original version from 2008.
> 
> Yeah, I noticed the same. I'd be curious what Daneil (or Jason if he's
> reading) says. I suppose i could always wait until your patch lands
> and then send a new patch that puts it inside the "if" statement and
> we can debate it then.
> 


The original board this was developed with was a 32bit eeepc.

The intent was that when v2printk() was called for a verbose > 1
condition the touch_nmi_watchdog() was called.   The test case
where a whole lot of single steps are executed sequentially was not
letting the watchdog get reset by the normal kernel routine.
The serial port was so slow it was pretty easy to hit this problem
and it would just power cycle itself.

The original intent would have bee:

#define v2printk(a...) do {		\
	if (verbose > 1) {		\
		printk(KERN_INFO a);	\
		touch_nmi_watchdog();	\
	}				\
} while (0)


I'd guess this probably not the first time gcc-11 is finding brace
imbalances.

Cheers,
Jason.



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
