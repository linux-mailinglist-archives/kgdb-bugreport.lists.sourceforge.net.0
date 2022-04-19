Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA085506734
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 19 Apr 2022 10:52:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ngjbE-0002vU-Ot
	for lists+kgdb-bugreport@lfdr.de; Tue, 19 Apr 2022 08:52:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hasegawa-hitomi@fujitsu.com>) id 1ngjbC-0002vO-E6
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 Apr 2022 08:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ETeXn93AVQlIbpKq9y/uHMq/VVQ0mz5Y/9SpIMX/92w=; b=NwN5J8LF4uCYNNATTbDCPRg7yj
 LOcbUNoZ/0KbUV1Ni6Bwuii4yi1ct8NqRos7wYeHk3hjfYYR2Ll+bWbJI6cVKhFjxO2GrgNlyUJcC
 zVUcnwQIOVBsQhuhdJvHdxiWOeSifHnCAOyHVoh8psKm5GhteFk3w3MKLNGaOenoL3Kw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ETeXn93AVQlIbpKq9y/uHMq/VVQ0mz5Y/9SpIMX/92w=; b=NCW1dBYf8Z2613XPhJmcoH5Bt9
 Xn6U6RDmdSuy5M/jrVY4rVVBYFz2PW1HL3fDo3MON1toowxV6+g2ICZNJS+Cqnn6wO8kJIgX+Ic3C
 iwRrZfvZuw2sdZ755MO6P6Hi3JxCLiM+1Do+rTY27inpzETHe0KzqVvJ5OY/zELg36LA=;
Received: from esa6.fujitsucc.c3s2.iphmx.com ([68.232.159.83])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngjb3-003ge8-7b
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 Apr 2022 08:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1650358349; x=1681894349;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/T3J+can6BmES4HH88atCk0Rf14VisLPpkrqYb9YOd4=;
 b=sVBvkGK51rfz2IU8jYpnMhMcMPmy6lp9Wecxz+lhRFBEzqIVm8o+fGwB
 h2prSbkSuaDnEbST0Y146OfSsE4N0AoY5H4TpyTbnRBrPxBER5Oq28Tj0
 b7mUqWVUa58miAiwivq5bENDS2t33DMFJZapjvAD46ZwBL5Ii9fIjrWRy
 ahHmX61uhGdmzecxZp9sdiwO7Bd9yl0d20huyymOwJYBYKC/EvHpuy7UD
 utYNcBEELOCc8MqZryTVIGmHG76ELP6xSIPtnLyllWGrgMVHoNsF0agfJ
 3AXC6Aa9J4Nx+d13xGnvdcoM7/mLAtMK+UMIfj3IChkIXaFovxD2ls9Q5 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="54213277"
X-IronPort-AV: E=Sophos;i="5.90,272,1643641200"; d="scan'208";a="54213277"
Received: from mail-os0jpn01lp2104.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.104])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 17:36:46 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSDDao6TCHoXNMMrPk/KdW2WlvCcwIxCJvzHFfvbKWkkcW5bS0h/jsClp2f2ktjkEzKiW/gXUvjKLgZIe76RycjdawQOLAd6iGb3R3OyeeXX0g43qXJ+trhbgWrUHPX/GsCj4DTUevaVuPePtsLIfNdI++S3y6Z0vh0KXVwyaexiU80DpolyO9ic/C1ZL6EainWTivjAs8+63fzz6lejJERnUHqA9ptM0mf2BbVPdUGBrzatPJrkfDgU1dJ3LmJoV5OLfRC+C+XWzH88iTcX5CDBaMbI25KZ0I6wLOJQb/D9st7FFfSBGu5IRyc5PFaWFSM16R3f+TlkDIMZaplqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETeXn93AVQlIbpKq9y/uHMq/VVQ0mz5Y/9SpIMX/92w=;
 b=lUw/HlReMDt5Mf5t5LogGA6BTi2RsAz3ZbOtd+6uUYEZmJC66V1sEj62caDSsraFMNubL+cr/oW6urr0zJUvaPikEMDsK1lMyOAOCIr/R2Fj44fZT6Llid+dpBbRff5Omh4bX7YtV9Do/58sDynxEelztZNzd6bTBVWuhU1XtFd1jZl2KsgmuK78mM/+tIv5zF+zAsfDRE6FsZXQOuRHXm5Q7LSKY5uBQF6FvQhYf4w6aqq5Wc6Gt2os2oSwCdfszFGpJ32TToN2G8uwE5nM8jmgHmqJNAxrf0mYGz47snX7SiFAJeGu63xOkluNr8KrambUAXARE1NtgNF2Ou/CoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETeXn93AVQlIbpKq9y/uHMq/VVQ0mz5Y/9SpIMX/92w=;
 b=HslR9D3W7dNE3U/l1ODkSmNOdXy0jMQpcScH8nPLZRN7UefcTEyZRSY0RPoPCLcs/rHItJN18+Yy9YPvVyxLXN8jh4iBrcW6rAMrNNne2zwe29WMKqHk+HQxdVkHW9V2RX09Piec+eQm4QmmPoijrOIEKYDuukF5oBWdGKK40f4=
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com (2603:1096:604:13e::5)
 by OSAPR01MB7543.jpnprd01.prod.outlook.com (2603:1096:604:146::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 08:36:42 +0000
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::a91e:d936:37ec:f656]) by OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::a91e:d936:37ec:f656%5]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 08:36:42 +0000
From: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
To: Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH v3 1/1] soc: fujitsu: Add A64FX diagnostic interrupt
 driver
Thread-Index: AQHYROFUWg6uBlnqVU2NIy0zBQeT5KzZYQIAgABBxICADG27AIAADG4AgAABLwCAAAfUgIAAA38AgBDcmG4=
Date: Tue, 19 Apr 2022 08:36:42 +0000
Message-ID: <OSZPR01MB7050BE18BC9E8DA05C00F478EBF29@OSZPR01MB7050.jpnprd01.prod.outlook.com>
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
 <YkWVTEG5oFO82GPL@kroah.com>
 <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
 <20220408133246.fyw5554lgli4olvg@maple.lan>
 <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
 <YlBE6hZHmLo9/wrU@kroah.com>
 <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>
 <20220408150202.yhn3qppqwm7wzmo3@maple.lan>
In-Reply-To: <20220408150202.yhn3qppqwm7wzmo3@maple.lan>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2022-04-19T08:36:41.167Z;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard; 
suggested_attachment_session_id: 194ba67a-7e59-e6e5-8924-8374800f0446
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c08f67e8-2e41-404b-e636-08da21dfbafd
x-ms-traffictypediagnostic: OSAPR01MB7543:EE_
x-microsoft-antispam-prvs: <OSAPR01MB7543B230AE58E8CC9629FCEAEBF29@OSAPR01MB7543.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W/0G+jUw+UB3IVPlcepLsZqkljSIX1uzMaMyTmgsmWFW6RGFLkLCJoiOfNypjOP46NLcOONQucbbH4xVolZDSpXi87i3DVVvgd2+vCzfAvxJjOEb1Iu/xYusOcCh5dIDPaSsk57PKBnfCohXQEZQv86Sv2lxVzEIvLpJpgva17hhOmwdt5vI5E3Gu1XT+FNzcw/Dckmq5JmDF/GFMQRNIb8ScNdDnk+cEcKHiRuyTqF4ABZnkB8MK+CWLH7QmFuXnwG4hH8BnGzC/IAw9ZmL9ogwCuSyjbOpy1R/uWtvtA72Qg8DCoWCXg+PrZHNbbAhC7Hdmotz9ysNyGlGjhsY7UPokrqP0fptEKn4yzfnChdXH+UdLDsLV+C0LvYqCY994TW7HidwFUdtORKyg8IjQm1eMN8sUwM+1ZUuVI0643U1+cWslNMZguVinnjvvrYmuQfzZwx8PyTN4yeDeYuqnp6qsPrsq8bNrUPa6fdL32OtXwlgHn9KeX/PZPyimSGI1HdI2yDEyY31UgkPFshb36+HifMXfZBgqL5n1o7Dg+Z+6wJZTXOhK+0Ezo1k4X3s9kawAFkeflujxCc3aqX3rUN6GisbvvfEMDfi3/PCeHFobYeG6cyyvbIfnCPVOMWU7ulcc8kcjhZumeFkwn6F9Yqlu+vpNDPXyDo3H3fYPyMQndRcQKgZO3Hf0rq9WwqojXYMUWHFki//Lphp2mNlo4TezbAOwlzF1KXRKf/oERvrB0Hh+kST04MLNAZQjG2Q7Yk3MSqGOCQCzBcBGCYr+XZlsv+vTTFfFReEZwuzINU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSZPR01MB7050.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66446008)(86362001)(66476007)(966005)(508600001)(38070700005)(122000001)(38100700002)(64756008)(4326008)(66946007)(8676002)(82960400001)(26005)(83380400001)(316002)(54906003)(110136005)(76116006)(66556008)(71200400001)(9686003)(7696005)(6506007)(186003)(52536014)(8936002)(5660300002)(85182001)(2906002)(33656002)(55016003)(7416002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?YXJ2YmtWZUF5cVo4aUUzT0sydkJvSWxlcUpLeHhyTXhqK25XUXg3RlFx?=
 =?iso-2022-jp?B?elVleWVjOS9qL1Z3dmtxbFJpdk90MmlPbU9jeVNTK2FEQnhPRFdCbXNT?=
 =?iso-2022-jp?B?dTV0azR2Vk9YK1dKMitaZnExUU84L1l6dzYrVXVWUXJ1eExSdVR0WnhJ?=
 =?iso-2022-jp?B?d1ZySnkybGIxVkMwcHlmcjgyOGt1cWRvaEx4dytzbXdUVEVZTWhwb1dD?=
 =?iso-2022-jp?B?TjVSSWdJSFB4NzZpckZTNTNWYzgrYnpLVkRJb2hVVVgvNjBQMUdNR1ZG?=
 =?iso-2022-jp?B?N1Rvdldld3RIR3c3S0YzRk51SEw4Rmd2VXdFVlZ5MmtaOFhXTElTbmlU?=
 =?iso-2022-jp?B?ajliYUxnclA2OVVQQ1ptU3I4QVVJM3A5dzhIUkpCc05pc0VPY3FwcERw?=
 =?iso-2022-jp?B?Zm9qWnkyWEZIUmNaUldCZ2FNeUh4RVVhY252MXhoekU3cjdhNVVlbmZm?=
 =?iso-2022-jp?B?ZVF2UU1QNldBdEl5ZkM3Nno5SlNwR0xQU1ZiNlpkZHpQSUpjZkQ0Z1V6?=
 =?iso-2022-jp?B?TGgrTGw3OHZZbXc4SFlyNldSd3JCUkdxM3MrU2pTRWFpWXpDbFFQdWVB?=
 =?iso-2022-jp?B?b0dKbG14cmlhblVNSE5PL09SV3NJTExLYkpyRXpoeWZCdVl4eTUvV2t4?=
 =?iso-2022-jp?B?eWdnbVkzeFVoTEVMTjBGU094YXVZeDMvR01UQ3NBa3BrU0ZiTTF6d3JY?=
 =?iso-2022-jp?B?V3I0aXBxc0lsS2hab2IxTkJxOWJoZnhvWG5nRmYyTjRqeTIxeEJVeXkv?=
 =?iso-2022-jp?B?ZndKQ2tIWGZaR2FoUUQzbWk0NS9TaHpmNGtnc2lSVjRHSXJabC9TODR4?=
 =?iso-2022-jp?B?aVRlWlZRR2Q5bTE0NEpTYXg5TnRuWUN3RHkxQUNZRlFPd1kxb1VrUjQ5?=
 =?iso-2022-jp?B?S1U5cG9ydjVhQUlzK3dZVDU1MXFtd1FjdjRaVGNoWTZIb2VPUzVERy9J?=
 =?iso-2022-jp?B?eVEraW1sUFpnYXJWRy9OVnRFZWFkU0lEb1lLZWRiL1BmQ0lqdjFQNTgy?=
 =?iso-2022-jp?B?V1dVM2U0R1JYd3BRMit5L1hVQlRIMDNnWFlFanRucWh0bFgrRDJCTmU4?=
 =?iso-2022-jp?B?QVRvYi9vZEs3aUV2MDJaZUZBNGt6ek1OWXE5c3gvdCtmcXJTVldPdmcz?=
 =?iso-2022-jp?B?cXZnQm1YSUNOUUtxdWgyMldQeGNZNzFBR0JzdE90MEhwRkJXeGt6V2Nm?=
 =?iso-2022-jp?B?VEZMSVk0Y3g3SmlRZDdnb3lOK0xSUGJ4NXpFZ1kzWk5oQ3U1dEZRVVhh?=
 =?iso-2022-jp?B?ZlU2bFl4ZTNVUG5Gby8xbUtYdHZ3Y2h6NWo5VlVmRWlBNFlOU1d1dGdW?=
 =?iso-2022-jp?B?Q1Z2bkxyRHBTMjJqcWFZTmVET1kwVVYxTWRIS3Z1UHBKUHRMU0JFTi9O?=
 =?iso-2022-jp?B?WnM2amovQmxaOUl3cG9JSU1tODFPSW42dWZpL3g3a0M2bGNKN2pLNHJS?=
 =?iso-2022-jp?B?emRaRVpjQVVRUU4xQVRUWDF3aDNwRjY3SEJSWUo4akJBSklQVlREL2hx?=
 =?iso-2022-jp?B?ZFR4cVFEVnBLS0c2UCtCSUlZOUtKaDV2cGlwUnpRNGV5eVhNeS9CTVV4?=
 =?iso-2022-jp?B?R0hvNXJKTkZkTTFsMXFaSGJqUXUweDloTWxQWXpKRlhneUxnQlRtWko2?=
 =?iso-2022-jp?B?SE5zQ1Q0TDg4eWhCZTA1YmE1T3dJR2g1YkxjZExud0hkK1MzbCtLb2VZ?=
 =?iso-2022-jp?B?ZG1tbVkrN25USGc3VFBoVWhUc1huZm1JQm15ajQ0QXBFNGhLZW4zZXMr?=
 =?iso-2022-jp?B?enVwUkVaTjJnK2k4SDRNRnVCajJEZk9IRUxta3dHTEovTy9UdEp5MVds?=
 =?iso-2022-jp?B?dDV5Y1Q3RHFsR09zOExyMHdvanVVM0hwZ2RFamZwWjg0UFk2bWErOVRD?=
 =?iso-2022-jp?B?dXlGZ2loOVZSYWVDUVlnS0VnbzAybk15WVJlWWZRalFONGJ4MTlEY3Ri?=
 =?iso-2022-jp?B?a2lOSkJ0VG5oaWd0ZFV2aXNVeVFid2NOOVJNdlNITkMrWTlxdFVJODM3?=
 =?iso-2022-jp?B?eGw5UUtLWlFUdm1VK0tmT0dpa2tZTURCUTNIZUwwR25uUENoS0YzWnVs?=
 =?iso-2022-jp?B?Vi9xZ1AwanBuVmFQaUU0WTNad3Zxa1Z1QjBDN1VXejhReGxzSDZEaThH?=
 =?iso-2022-jp?B?emFkOXUzNDNiSGZ0S3JmWVVvWVF5K29kQ043MFRxWU5PZmxVSTB6YVBm?=
 =?iso-2022-jp?B?U1RsVWllaWozbHk2YU11a3RJOU1xTUFEU09pZXNtZDRaK1p1V08vSnJm?=
 =?iso-2022-jp?B?OERZOXN6U0hJZXB4MnIyZU0zWlRjS3R5TGxqaXA2Vi8wdTlNYVhjUFRE?=
 =?iso-2022-jp?B?aHlaRkNsd3laMVY5Tk0vdXNXYVRwUS9uYmxZM1ZFVmdzRkd6MlYzS1BK?=
 =?iso-2022-jp?B?OXNGQ1A1RHRGMHQ0TW9lWlM1ckpHdVVGT0VmalBvdXBmYkM2TURiaEhI?=
 =?iso-2022-jp?B?anZXZ1Y5cWJSYkU1cXM4L00wQ2hZS3Z3VW8yRHlaTElzb053OTlDVnl3?=
 =?iso-2022-jp?B?cjhsWEhVRUJmaGJPMXpiZmgrajdLWDU1Mlp1Y3Blbm9lYWZOd2Rrak1i?=
 =?iso-2022-jp?B?SVliMU9Waz0=?=
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7050.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08f67e8-2e41-404b-e636-08da21dfbafd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 08:36:42.3253 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sl78iFSXc7KrAcIf0Ol6Q/H8I8WrgMpQZxZWyZC0JHjD1GZPSwi4SKlV7YoZ1+OQdHSpM28qgvQfoCXN7F9Ap2MWZJDPnfyLzb1eCc3LbLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7543
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Greg, Arnd, and Daniel, > > > > > There is some prior art
 for this sort of feature. AFAICT SGI UV has a > > > > > similar mechanism
 that can send an NMI-with-no-side-channel to the > > > > > kernel. The
 corresponding driver [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.159.83 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1ngjb3-003ge8-7b
Subject: Re: [Kgdb-bugreport] [PATCH v3 1/1] soc: fujitsu: Add A64FX
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
Cc: "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>, Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mike Travis <mike.travis@hpe.com>, SoC Team <soc@kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Greg, Arnd, and Daniel,

> > > > > There is some prior art for this sort of feature. AFAICT SGI UV has a
> > > > > similar mechanism that can send an NMI-with-no-side-channel to the
> > > > > kernel. The corresponding driver offers a range of actions using a
> > > > > module parameter:
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/platform/uv/uv_nmi.c#n180
> > > > >
> > > > > I don't think a hardcoded 'c' makes any sense. With a hardcoded argument
> > > > > it is just obfuscation. However it is certainly seems attractive to be
> > > > > able to reuse handle_sysrq() to provide a more powerful set of actions.
> > > >
> > > > How about a module parameter that allows picking a sysrq character then?
> > >
> > > Module parameters are so 1990, as this is a platform device, why not get
> > > it from DT?
> >
> > This machine doesn't use DT. I suppose the same could be done with an EFI
> > variable, but with a module parameter you get the added benefit of having both
> > a boot time kernel command line argument, and the option to override it at
> > run time.
> 
> Pushing the decision on what action to take into firmware (whether that
> is DT or ACPI) implies that the firmware is well positioned to make a
> decision.  I don't think that is true here.
> 
> To me, it seems more like an admin choice... and admins are conditioned
> to use kernel arguments.
> 
> If these type of diagnostics request were more common then perhaps we'd
> be looking at a sysctl and call to handle_diagnostic_sysrq().

I understand that it is not appropriate to hardcode c.
How about using __setup() to add a new kernel parameter and allow the admin
to specify the sysrq command when booting?

Thank you
Hitomi Hasegawa

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
