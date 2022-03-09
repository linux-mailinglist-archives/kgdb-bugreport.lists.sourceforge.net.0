Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E87B4D2632
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Mar 2022 04:11:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nRmjv-0003bA-68
	for lists+kgdb-bugreport@lfdr.de; Wed, 09 Mar 2022 03:11:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hasegawa-hitomi@fujitsu.com>) id 1nRmjt-0003b4-GS
 for kgdb-bugreport@lists.sourceforge.net; Wed, 09 Mar 2022 03:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JJd0yyPl/tuCxhNMaAuXbRzgHDz7X6UWmQHZ7RqCBb0=; b=hNAWrGVqEgFH40+jCwU2HPygwx
 SkfukU3Sp43RPp3zzrPB/hikQ02b4dUTSPzCmwzR7s3xjFJAynaIzfRBRalgRQ6esrk2xKoIcan08
 P1lGM0j1QPaZSjCW/slkwZvw8CLOg8OcNeJnoElfBZzexh3ntwba5/haNrYRXjejLRsY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JJd0yyPl/tuCxhNMaAuXbRzgHDz7X6UWmQHZ7RqCBb0=; b=YyYk+ByMiHMBx2pnmUlRz5dzEu
 gGDz5hf+WhP9eQWsC/VGZWCjx4CNGtcj67b6q0kMvBr1mCCtFrfyignsxeKcXvdSROYg8SBQ7gww3
 6iaO6SsA3FdfilICjRgGT/N/7anaaMLWYS+7dHdxvUMkDoyYOa0ffZ0A36L+eWf3kZnM=;
Received: from esa15.fujitsucc.c3s2.iphmx.com ([68.232.156.107])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRmjo-0006rC-2i
 for kgdb-bugreport@lists.sourceforge.net; Wed, 09 Mar 2022 03:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1646795505; x=1678331505;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JJd0yyPl/tuCxhNMaAuXbRzgHDz7X6UWmQHZ7RqCBb0=;
 b=FQJaYW63R0MZVHsPO6Z0JPMtoM1cLKSt82+ZzfWEhJXUQLKVpqt/U3IA
 g3bD9BuDNjk5B25eeVqr8lxyAp6OZwCM95kxLIkaQCtLzSVgB70x70YB2
 SuQ/2m9wmceC1Kr9kYDaPWrOI2SNoSbgHfyCBylAL9gAtIA50X9RpSYsH
 kfyEP9XKe/1cz08EFtVdE5xPuNBzadwkzwAvFp1ZQhqsyp1NkRSVjTv0e
 gaSQ4/XXOFamNNFozBpVd6aIno35VDUBdN4gKHPOhSlN5Rnv86chWcOeG
 +0Ft3RdhCl75EyfZUhgioKsolGEe3XtAzTOihY3ctngnhu27hu53KggY7 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="51263877"
X-IronPort-AV: E=Sophos;i="5.90,166,1643641200"; d="scan'208";a="51263877"
Received: from mail-os0jpn01lp2112.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.112])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 11:55:52 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odks6oJNpgJJlWCUK+juChGwSvoU5M2R/9v1zZEwiRdyNm2gYsAFCbbR+3B0l2ljG/PvQvqbvGcSkMC0R16Gxg1O3pr7LBsw9gu0mdxsle3b1oaitShu9UB4hQLZ4ql9DkJg+rrjo8UsiIiG0Rrz7HWbDZbwSry7fIa8/e3f4H1WT7wJgZPqeRgPEPWffLUPA2G74wkWMio3k8QYeQ19Whu9HN5ns7zfLRwCLBqLIUep7kjrq0Jdh6czW8NZ9yiEtcMPdaQWlDGK2VWsCKffcLi7yMch+2nd1GDnYPaW62L1Bm9vzffL7WMJLnmZ4n8uvog5bUo6rQdxoAokXWxcPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJd0yyPl/tuCxhNMaAuXbRzgHDz7X6UWmQHZ7RqCBb0=;
 b=ObGOJoORrihcUE0vm7IqTy4pvmalux6YKUspVcwmo4yfUXL3MImxpYU+HCL3q0ccA3aa2RON3L6ROke1ka7wBGAn46Ne3pD1Sz8uEZYTzhPCQrWWyizpwiv3LoXWbtQ88plNJW0CcWPsPFC3U4spDjJzFzmZUd/KybFsn+KxK+tmJUcDvFR9MNSOjpFXvJKf7Mk1x+lHsFKbrUrsKHBbEQULNi19KjE4Xlvhi16cP5tSFU+iJKRLX1hKIPDI1HQv6wLQFR37cLCiEXqI88Wgor8HRKRV6+XZFlMZ3iq/sPFK0vdnQ0PIOBZAcjNKoENkzL4B2B3bQoadNJLHa6503w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJd0yyPl/tuCxhNMaAuXbRzgHDz7X6UWmQHZ7RqCBb0=;
 b=Hyf+NGGJWkSK4JlPSTU284ZaswHELgT+GxJlM3AyEdu7eWZ5h8h6NVBpWOVOrqACny83tip+foIB8cG9YCzhWPCvc0dGAq81tC7bWPOAnvBYhSmMyeqEb6mTv9mFtCRk3R7dQum3wPjuaxLniLKysg6abS6WKcsWgu8yKsXdfiI=
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com (2603:1096:604:13e::5)
 by TY2PR01MB2331.jpnprd01.prod.outlook.com (2603:1096:404:75::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.18; Wed, 9 Mar
 2022 02:55:49 +0000
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::e8a9:971f:52b9:8d07]) by OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::e8a9:971f:52b9:8d07%9]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 02:55:49 +0000
From: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
To: Sumit Garg <sumit.garg@linaro.org>
Thread-Topic: [PATCH v2 2/2] soc: fujitsu: Add A64FX diagnostic interrupt
 driver
Thread-Index: AQHYL5N9NH7YBhS2wU+ZKVA80VMN6ayz07gAgAFqVqI=
Date: Wed, 9 Mar 2022 02:55:49 +0000
Message-ID: <OSZPR01MB705082EC83690A56ECC2BE79EB099@OSZPR01MB7050.jpnprd01.prod.outlook.com>
References: <20220304064324.331217-1-hasegawa-hitomi@fujitsu.com>
 <20220304064324.331217-3-hasegawa-hitomi@fujitsu.com>
 <CAFA6WYMESyto9bFtk2qNBMi40BkJOoUKpYtAScXjb3yunhHTJA@mail.gmail.com>
In-Reply-To: <CAFA6WYMESyto9bFtk2qNBMi40BkJOoUKpYtAScXjb3yunhHTJA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2022-03-09T02:55:48.605Z;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard; 
suggested_attachment_session_id: fa229cd5-699f-884b-76ee-bdd4b157060b
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cf82cfe-22da-49e5-99bd-08da01785102
x-ms-traffictypediagnostic: TY2PR01MB2331:EE_
x-microsoft-antispam-prvs: <TY2PR01MB23313B0841B8472EE4784A68EB0A9@TY2PR01MB2331.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5yR0RZH4velhonDxb/YFR1OAtJvvezfW4aTu6xGq4/KYSDFjWPD9+xUzbILbiEgU6NPTLcL6LXaXCVCEvBKcsYMSZlDGdEguhNc0Xosz0WxCU37+E2gmfN0NoQJaVqDG/VFOULiW+OT6cAoclgxMSujrsnzK/Nqgd/kR3xMeC0o+i7IBYzAS7HWUjIZPlU0860IZ5lpaSluOfWHobw9yiuTbpWFy1efhfYzGnKBoxqXjQObaHfpUPVRgop7XiY7/F+bnmutrWmxcmzzdgYp21TAh9UWm17jkfwSYHo7PRNdHZoltEfP25yFvUPEbUfRmPNUENogs1lP4os757O6/IXPV8gsal5Ts/nwllQ9v8wLtkwApYuYMaNnZMPjacX6cjM+VDmo66LvChbn/xLWEVn7Lh6tStQa3mtHMjlynfvOu2AQ3jT3X3ra2B8TtAjQDsj6VaD1hcBGFuK4fbLYYpALqf9s55uuiGQ+D9gQ0MwHo+aVP9aHa2KiH13IB85enqZUExEgHvZI+cK3vI4abRXTg5GWpViW3TJQTYQFmnMv18PuOvE7D0SFFcjPcnzoCTesbH5cr1Y9OfCfDwn5Wyi9RpyR/SDUg+0XH+MZbBaMX2z0hqYdMxJFLrIdRode9XdJXidolT3kU1MS22CAzsAJpvEChuLtrEJAcShVHlGJ7y0aj1h/yO2Jt82MyhvU/t+sERz7XL4CU7CtuaTt7yA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSZPR01MB7050.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(186003)(7696005)(33656002)(26005)(6506007)(38070700005)(71200400001)(9686003)(508600001)(54906003)(86362001)(55016003)(316002)(8936002)(4744005)(6916009)(66556008)(64756008)(7416002)(66476007)(66446008)(122000001)(8676002)(66946007)(76116006)(52536014)(5660300002)(38100700002)(82960400001)(85182001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?ekg1OGV1cFBLNHN0TlcrUFluL2Rra3hjcDBXRFZkK2QwWjg5aUloU0xn?=
 =?iso-2022-jp?B?N3FobUpsdzRmVXRNeTEyd1AwUm9FdE43d3Bia3JxWnlGRXdtZnVrRzhL?=
 =?iso-2022-jp?B?aHRaTURzMTZXdTZSOHUyY3lvUjVwcVllYVBPSndRYXYxUE5ZTGdQTitK?=
 =?iso-2022-jp?B?TGtlSnpaZVBiTlpocUNXeGtmVzUxUm55bzZMbmZuOVR6dTA3ZFdUbHg3?=
 =?iso-2022-jp?B?UUJ5bURFbE9QZXdqcjduU1dPZjJDeHdpOHB1OWlURXFyVkoyVzkzcmZi?=
 =?iso-2022-jp?B?QjBjb0tycUhlcTdJYmIvZnVLSC9YcG41Y21MbktwdFIxNVVWQURKWjA1?=
 =?iso-2022-jp?B?cDNnZzhsekRMK2tSTnR6SFBhVDRLbEJrNjhDUFRleXRuM1owNnJuMHVJ?=
 =?iso-2022-jp?B?M3Y1OFN1ejNYTmdvU29VcmFkRDFjTHJQd1JlTFlzRHJGdmVQSlQxTnBz?=
 =?iso-2022-jp?B?QXdNSnpJZkFKYVRJSlZGWjBPdmFodTgyY1ZPSjFUUUdPOEQ2NjBYWktt?=
 =?iso-2022-jp?B?UmxZQmhINHYvVmJlTkNZUVVwL25QWUF6QXNydi9ybDFqck1KT2cwbXMy?=
 =?iso-2022-jp?B?U1cxbCtRUGtTTXFETEVWend2NTJyT0cxR3dzNlZWWTUvc0NRNERVQWJ5?=
 =?iso-2022-jp?B?MXBnSlY1b3kwVVN1Zi92dXZXbVJCb1o2RWNSSHkzUEFKckNxTjIvdUsy?=
 =?iso-2022-jp?B?aUlGcmZtMkdYdEhaVnFxVjFqL01EYjZweFRhOE9aWndIcnBqSm9xQXBz?=
 =?iso-2022-jp?B?SXFkc0c1Yk5XY3VxTVVKeEc2eCthQUlXcmQxc3BUZWFhTjd4S2tFanpC?=
 =?iso-2022-jp?B?OUlRekl3d05FNzVpUnhvZmNteGxVbWFSTzdPcGVzYnM4QXJ5MzZLeGxa?=
 =?iso-2022-jp?B?bDJzdFIwQWZ2NDR4RXpkNTZrNmU3RjFPMFgrT0IxeGZnZk9mMFN2Ukhn?=
 =?iso-2022-jp?B?Q2JvM2MwNzFENjBJa2hWbG9CU0phR0ZoUmI4emZQUWNmWTJPOU5VMUxz?=
 =?iso-2022-jp?B?K050K1JTTW05NURURW1wajVuZlIwb3FoVENoMkRjbTl4YWR3ZDRFUlhz?=
 =?iso-2022-jp?B?NlFxdC80QUxTWW5KVW55UVFGZWhzdEx1Mld2OHBXdjBUTEZVZVZ6bXRo?=
 =?iso-2022-jp?B?OElkMEUwSURXRDQvZ1FtQzYzZ1R6Z041QzlkZlBJL0YxSlJ1MU1lWG9J?=
 =?iso-2022-jp?B?d2xsdEQ5Q3RodjRXZDNWeVBVYkpwbFFOZ01xSHh0MlRtUHUvUzlvMC9G?=
 =?iso-2022-jp?B?VVZCMno2OHQ3TjZCVTdnbGRuWnpsMGJYTWt6YUliVjN0SkJnTmNoRTJQ?=
 =?iso-2022-jp?B?RUw2ME9wcTA2UG1NMFlNSTFBeS93ODRBempra0hBVVJKeW5ZanZ2THVS?=
 =?iso-2022-jp?B?clcwZTdqYmpDSDExL1YvNWxkcy9vS1lMaWVHeHZ5c04zbEVqMUdCcVBo?=
 =?iso-2022-jp?B?VGc2cXZ4UlBaYldIQ3p0cXFRQzZPbll4UzBDekErbVdDR0JlWkMrWGhT?=
 =?iso-2022-jp?B?OTdFUlBiTnBHaUVIb2ROckdRbk5mbDhQbXJBSlgvc1EzTVVGemhDd21R?=
 =?iso-2022-jp?B?NG1wakRvUlI3Q09TcWNOUURML3hCblNxd2c2aFdFcjdvNGdEU1czVWhQ?=
 =?iso-2022-jp?B?dlhuUncydHBrQ3RtaW9DTExKRjBMWkJ6UEh1RDFlYnBEaFNBKzVOdE15?=
 =?iso-2022-jp?B?MjVrZGIrRHVFSjQyZzhpMzI4dGxUbU5Xd2ZIbmFBYkNRbm9oYURBTjBz?=
 =?iso-2022-jp?B?S2tadU8vM20wbHRGSm1VOE9zVWNjb2F5bjFFOUJYTXkzSHExdzA5K3pG?=
 =?iso-2022-jp?B?N3liZU1nQ05paElrRlhhdmNnWHJpb01jWUl2SGEyeDZKYVRNMDNDeE90?=
 =?iso-2022-jp?B?UjJwL2ExR1hiQUsrOG1qU0V1UkN5UTQ2VERPVHAxTmVxMEdsT1FkdzZs?=
 =?iso-2022-jp?B?U1YwMjBkaENUeGxtODIyTGxWaURQS2o2emlFbVpTdy9zL3ErNmlwYVky?=
 =?iso-2022-jp?B?THNnc0lRWXR3Tm83aXMxcGt0T2xmbTI5cVhaWWQ4TmxUSWNLSG9aSHhH?=
 =?iso-2022-jp?B?cDBlaEhrQUhETUN5N2ZUV09kZDVmRHIvUUtoS1YzaFhNZ013U2pVUWxT?=
 =?iso-2022-jp?B?OWFYVXBVVVpid2d5dFN1SExpZjlUaWV0UTBUQVBYVmJ2SktDY2JZNHVi?=
 =?iso-2022-jp?B?RGhSSktUbFRFcFYzUXRKNFNnYzZMYzBIZ1lQOVYvUy8vaXFsWU1tcmt6?=
 =?iso-2022-jp?B?TjY1KzZsYWFaWlpBVkFzejlQajFudzU3YzZzMWI4K2Y4cDdtR2FSS3Ux?=
 =?iso-2022-jp?B?ckNWdDhoZzljb2JVY0tJQjF0Y1l4VjJzbmp5RHFqTHlpcDdyWXFtYmtB?=
 =?iso-2022-jp?B?dStYeHdnZGtaUmlGQTZJWndMQk5EVWxaWHFKNXpQVFlERk81UTNrMWZF?=
 =?iso-2022-jp?B?QkFXODNnPT0=?=
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7050.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf82cfe-22da-49e5-99bd-08da01785102
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 02:55:49.2706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l8dhBNZUEzT9TP7GPu12kGZJJ68K9f+SqJlnZCh8teQ/8a4V7s/6spqwhaaF/3gPu0YlldDUaHrsoOiW0YYwGQqSixo1D/Iy0YlTwHPoe7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2331
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Sumit, > Would it be possible to pass a dynamic sysrq key
 from BMC to the host > as that would unleash the true power of sysrq in an
 NMI context > capable of launching kdb as one example? A64FX's BMC supports
 a subset of the ipmitool command but it doesn't have the ability to
 dynamically
 send additional information such as the sysrq key, so I don't think it's
 possible. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.156.107 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [68.232.156.107 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nRmjo-0006rC-2i
Subject: Re: [Kgdb-bugreport] [PATCH v2 2/2] soc: fujitsu: Add A64FX
 diagnostic interrupt driver
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
Cc: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "soc@kernel.org" <soc@kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>,
 "will@kernel.org" <will@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Sumit,

> Would it be possible to pass a dynamic sysrq key from BMC to the host
> as that would unleash the true power of sysrq in an NMI context
> capable of launching kdb as one example?

A64FX's BMC supports a subset of the ipmitool command but it doesn't
have the ability to dynamically send additional information such as the
sysrq key, so I don't think it's possible.

Thank you
Hitomi Hasegawa

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
