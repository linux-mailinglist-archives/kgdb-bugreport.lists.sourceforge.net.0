Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D3C4F9308
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Apr 2022 12:32:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ncluy-0007Sm-1U
	for lists+kgdb-bugreport@lfdr.de; Fri, 08 Apr 2022 10:32:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hasegawa-hitomi@fujitsu.com>) id 1ncluw-0007SX-JS
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Apr 2022 10:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NdC54XSWxA9wtHjXVTeU06IQDWoCM3hbljZ9/QOYq3I=; b=V51BPap0S+SEU+3/UGVy6T7wRi
 5aWYkscYSxlUasvqldvHHSv+6wmXaEdUMGNEMkqfLjldtE4c3Ddz0QNLuVsxKJ4fzMhj1e1RYj5Mr
 nF6hXaG/+45IKWRpmJIFKuyH0MwlLt4me8SWmx74yO+5+7EmfdiaxD0cKH9fMTZUx9FE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NdC54XSWxA9wtHjXVTeU06IQDWoCM3hbljZ9/QOYq3I=; b=KqrUSxEaCrmvy3bkqhtngWpUOv
 rc2aDHmfFfw5ZoZXcCMoz4mojAfo+F9YuYfm6UxFsEYlfEXgZ8+VIEhECJJKDCLXABKq9lcp2Gljt
 msLt/pFu8v/rgD4GtXdtT5Q2NOoanHAsLBTVqn5FtvGqGjgQZsteWdCQlBFXm6HS03Kw=;
Received: from esa18.fujitsucc.c3s2.iphmx.com ([216.71.158.38])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nclut-0007Pa-9J
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Apr 2022 10:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1649413956; x=1680949956;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8SEbYrBgOyIV3v8EU5DTeb3nWg5J3X3w3EGjrrVMAzA=;
 b=gME/I+V/Qa/1CvVHNUb5CxGh9ZLXEuEogI1vIORNmtqYeRckuYPUkHx1
 e46uoc817/658FLJkxfF36nSh4G0j10lCIxFeiveAYoLsr4Y42OGhmMrP
 ghgE6LkYIOWrjjoiH9s0lcMiBXAV+1KXnNNDHwQaIjRQ8UeQEzkrFnz63
 olcxOmHkNZ/TZUK94dwZQYqMeBlJtSc9WwOn5rL3ebHLMgjiv/qd/CDn0
 0qFkTxKA1jtSvJVbtV9YFzqewX5a1H7fIf4+yOAq2Wt+09kaEFvCt57k9
 SEn0K9GeRmoHwaS9kNQCHSOAafMt1VgnTd5BoyWIqnMrLXCg8yqp6A6CM g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="54726668"
X-IronPort-AV: E=Sophos;i="5.90,244,1643641200"; d="scan'208";a="54726668"
Received: from mail-tycjpn01lp2177.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.177])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 19:32:20 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhY207AnXWiDk3nsTaFXIo5aQmZaujmtE+/BvKA9TDwXVUAtCSd3vDHJ+2DKYWq5QUHNAWYPYx6p6MM7dI98A9f4EnfcBJDwBJvb/r4JfbI3wVPROJCkz2vPQlpVsI9IqESbODtzVoEMm2dBkvgZb9//RmZgnuthc6TV5ZhpUUkV84mIsyZEMZZjkiPNjA2OyLCx0OekfcjdGExyVGV0WPQGBWNO6k6jf3kf0Pb53XB+Lf5JCeSiwnxbTULj6a5hTzYYgW3MmDLukHb8c2umvvblv20JavkxNy0/lD3+Lm8v2qYIsqKw9zTIbUZ64wqiccWTNiV9Qq1aoQZ+5jo9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdC54XSWxA9wtHjXVTeU06IQDWoCM3hbljZ9/QOYq3I=;
 b=NkV23UEP9qG4VGx8cprA0gsKQ5YD1A9hPYnelN87nEd2dE3JlSN3+q30jNwLlIcM0jaCqE1cWek6BcLGwMmYoLl0x/MQRh/uJBhaI6QKfB/9vSawXQxC0wF508uu7OLQTB8D45p9lKXdhARDVEzm/VMhB7Cy283BY+S5KC3ocNGx8LqVa/G7u23ctOey1j2w1cThmcllzgIWONepJtUM3jmNfNPNCZZ9OCflymsB2GbsplgiBWNwzHJJT8kGtcdByb16bLjJOhlKNXSBNogs6HbXDrQvIOf2RLMq1k25LnGmRVVtuH/8ZkmWbSWJNnJcL4mKabJDWAg1fnJ8qEmrJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdC54XSWxA9wtHjXVTeU06IQDWoCM3hbljZ9/QOYq3I=;
 b=Y1B4CTYBcAJWdT5X1tTzTPQ8Fe51mXzlk4WdXai4PP2ZnkwcFd89eXhASm0jfygwNF9JcMB1sT8Z69JqMkeSgDIB8Q12mKlR5KEoHGCQgssnngxirDtpDHpIwM1/DS4gYNMYpeymz2+RGVF9rqvQVHAEVCySXUZl3XFLIu6EqGw=
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com (2603:1096:604:13e::5)
 by TYAPR01MB4784.jpnprd01.prod.outlook.com (2603:1096:404:12a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 10:32:16 +0000
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::a91e:d936:37ec:f656]) by OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::a91e:d936:37ec:f656%4]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 10:32:16 +0000
From: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
To: Greg KH <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH v3 1/1] soc: fujitsu: Add A64FX diagnostic interrupt
 driver
Thread-Index: AQHYROFUWg6uBlnqVU2NIy0zBQeT5KzZYQIAgAdi+j8=
Date: Fri, 8 Apr 2022 10:32:15 +0000
Message-ID: <OSZPR01MB7050ED8D47839EAC9B4FC5BFEBE49@OSZPR01MB7050.jpnprd01.prod.outlook.com>
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
 <YkWVTEG5oFO82GPL@kroah.com>
In-Reply-To: <YkWVTEG5oFO82GPL@kroah.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2022-04-08T10:32:14.684Z;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard; 
suggested_attachment_session_id: 3288d822-e269-7beb-e4b7-24d55e1c63bf
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39e905fc-2b53-4b1c-2548-08da194b0d39
x-ms-traffictypediagnostic: TYAPR01MB4784:EE_
x-microsoft-antispam-prvs: <TYAPR01MB4784B81B8C06F5E9C772F28BEBE99@TYAPR01MB4784.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b+ht22gJ1IYf+dUTJr/gvwA8w4VItbx4VfmfIxtcsn93qTxRqbqOFAEP9YGzpn7v53zi3OeNx4+0q4/FOXZ4WiYpccr0Dwp2tTASr1jXy9a3IPp4QJLUUfsDfLkemAkE9HBbRddYyMVFBYXBYew/bLeoxivPpEVqxz+KklaeQSUDW8Qypw1lQSbE+LanrceYOUezQferkP0lHw+IX950Rfh+M7BPTfWSvBqKCsT7Ym5YnFex7daQGS3UolbOzxUwngUZ87lv+Lyiy3/wMqescaW01+Ph+Xi2xqDUryJWWNF2m0mPwESs3Sz6/IzLK3BwpDTn+R94v1eogQx34dCrVRvK1EZfunGO/4koeru7eOCYXK8AHrjbqJZs2QFe4TDj/mp1vgWHB1o01zC7/o0xZe1SNatkl5O79PN4EB/iCIZtkl2bzHg3Z1anUTo6DNS/ZMLqpIcsFusC2wWXjBRkj3QzNCINBH/BnJogNkPv+MQ4JiUCj6ZgGI8u4SFjzEvoYiUfieprnHjjeIWAERiE2mheiLyCbdtkHMTVgwnXDidd46GdZQGCwSc7nmIFB1XleDwUTFLwGOx8wHgpf7ecVqKvbqm4HyBwNdNgJC+nLszYIofW8tdS83gJE4vQWEJ3kh1l/Hygjq/gZ5IC0cs1XhKd2sKeufsNJ4H1qJ9nuWby5um441rEgYQDGHACA3735H8GZp4aZ+k4N2oK0lChTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSZPR01MB7050.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(83380400001)(2906002)(8676002)(9686003)(7416002)(8936002)(33656002)(5660300002)(186003)(26005)(52536014)(508600001)(7696005)(86362001)(6506007)(66446008)(122000001)(64756008)(66946007)(76116006)(66476007)(66556008)(82960400001)(38100700002)(55016003)(316002)(6916009)(54906003)(71200400001)(38070700005)(85182001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?SE9ZVlliSFpXU0dOQXcyTHdseTNyQUZidllqY2ozb1lTTGw2MVl3bGZH?=
 =?iso-2022-jp?B?OFJaU0laQUlDbzBKNHVIOHdlRjJBd1F4L2Q5K3dvd2FTb2ZsU0hmZGJF?=
 =?iso-2022-jp?B?S2srYjFud1Ric1g2SHU1K2J1T3ExSHAzb3lpT0xKRGZyd2w4bUM1dkdp?=
 =?iso-2022-jp?B?RzRWTXpTMXViVHRJV3BHODhRdDdFRis0MjQvZGtYenhSUHQ0M1JES21G?=
 =?iso-2022-jp?B?TGpkU0F6bTN0WEtZU2txRjBHMnNia21aaDhwZnNkSEtJbUprYzcvQ2Qr?=
 =?iso-2022-jp?B?WFVFL3RnbERYSEhYN2F4eGU0Y2I0T1l1YkZsYnYvZk9iVzA5dXk5Zng0?=
 =?iso-2022-jp?B?SFA5RFVUeEhGZ3pLZnZHeVVvQXY4UXNab1ZSb2FFd0ZVNWowdHpoRnkr?=
 =?iso-2022-jp?B?d2lxNkpHWXJKNlYycHBpNS8rZ2xwaVpWVldPSWlIdkcweVBnb3IwOW9X?=
 =?iso-2022-jp?B?bHo1QkhSZGtmUkFESExLdC8vNzN3dUNzd2lqY1JlRlQ2YmdIOGphOEo4?=
 =?iso-2022-jp?B?b0h2WldBYkNXSEh1cjdOY3Z3UEIwVWZralc4dFdycGpncEZjMXFsUmFW?=
 =?iso-2022-jp?B?U0svb2E1dTdSVGo1UklrbjNEN3RSUGpxY2JIdXVFNlBMbVlCMjZMZE9u?=
 =?iso-2022-jp?B?UlBEcHU1YUhwOVJEMThDNDRzekNhYmNtVnhMU1VRWjRueFJzVFFPemZu?=
 =?iso-2022-jp?B?ZmMveWxUZFdWdnZWZUxzOU9NTXJ6c2pZWFVZQ21GcG04QTZGcHhrL2lr?=
 =?iso-2022-jp?B?bkNKWS9qTG1tbENQOUdUZlZqeTFIYUhzR0ZHVnY2WTR4UkdsWFc3MHBH?=
 =?iso-2022-jp?B?QnFiZjFld2FPRlloMjVoNGlHQ2Z0MXdIRVh0b3FPQzNUUlRBVE9HQ0NL?=
 =?iso-2022-jp?B?RU5zTzlzQVRqRXhndHFhb1hieDFWbGxHOVhtaFdSV3R6b25QM2V4YzFh?=
 =?iso-2022-jp?B?TnpvZlNGN1R4Q1BrU0RsRGFTS1RlMUNPa1NXRkhXcXBVR3RqcW1EcGFG?=
 =?iso-2022-jp?B?WVR2c2tlS25NeTIxaTFCYUJzK0IzWUw1QXFoOUY4Zk9xNE9TV0k4MDNM?=
 =?iso-2022-jp?B?WTIzUGNZUHNVQzdLVllTSHVma0EvNXN3RE5RcUlEd3FPTUlyalNKc3k2?=
 =?iso-2022-jp?B?R3BSbVBJT25JWU8ydDhBZ0lOV3pxRWZBZ3VKTnpCRzNMZ3lvOVhJc05C?=
 =?iso-2022-jp?B?dTlheHV4YndhOWZHZnhvcVFSbVZWZVRXRHlLU0p3NHQ0SUZQM0hoM3BW?=
 =?iso-2022-jp?B?YnNkQ01SUUkraEZPSEhWd1pjY0QyMSs4REowbnI1RFdlWFJnY0FmdG85?=
 =?iso-2022-jp?B?ZHVvTU44NkdteEMybDhPUGpPSENxSUtqeGxSVjNMdXBHQy8vV2VnWFBI?=
 =?iso-2022-jp?B?WE1UeFRMSGhjVjVCcWhUVmVlcDd0bGpKUnc0YnN6L2dYeFJVaWNsV1lu?=
 =?iso-2022-jp?B?M0tmSk50ZCt6aU5FeENmWHVHVGdBQmU1WTBnN0Y5WndaQ1laVkp0NkNW?=
 =?iso-2022-jp?B?aTdHaFBEMWxjZ1A2Q1NsR3FDVTVnaHkvd3dDZlA1RWxhbUJJV2ZLdzhh?=
 =?iso-2022-jp?B?RVBXUlhlWStGeHl6MWo1RjE3RVdGZjRHL1JzaTlXbDk3a1Rna0MyT01v?=
 =?iso-2022-jp?B?SkJSNy96SmpWTm5kTFVKazJlWmpsS3ZlcVVZMVVmWlVXQXk0bG1Danll?=
 =?iso-2022-jp?B?SGxjQ1oreVRMRHdoUUlRYUZQNG8wZDNTRjliYWdhVDh3UklsUDFJcjBk?=
 =?iso-2022-jp?B?bEpmdlZHVWtabHZ1NFU2R05vMGRqaWE2ZWNaUDRIbmJLaHB1bUJnTzJI?=
 =?iso-2022-jp?B?ZmRrd1l5dlRCeFdnc09BbThFTnYxcERmcGxMd25YU3g2VS9kZVpZQk5F?=
 =?iso-2022-jp?B?TzJGcldFTEtxNXMrNlMvVHFPOUhIY1Vsc2ZWbmt6Q3psR0EreFNwUng5?=
 =?iso-2022-jp?B?ZXBNZjMrb09hcUZlQVNwWnRkbEowQVE1V1IrS3N5cVBsMEQ2RlQ5YjNj?=
 =?iso-2022-jp?B?Z3g5ODVjTTNnZ2ppTFFNTmlVUTkrcjFLUVE4SUNTUjRDcVQ4cnlYdzNX?=
 =?iso-2022-jp?B?em11ZzZMYVVFZm95NUs5bE4rck1NTGVKZ0x3TmhsQ05kRE8wTWxBOXNF?=
 =?iso-2022-jp?B?NHFwTi9RbU9QNElDYVpqNlREUlBKdE9Xa05VVloxSE1CV1kvOHRrbjdp?=
 =?iso-2022-jp?B?eXA4RjlxeEFDQk9WYVlXSldMNHUzM05DM2lXVlFxMzBHY1QxcXB4QmJk?=
 =?iso-2022-jp?B?RXdCUlpsTHpvQU1rWlg2b2w0SS9ld2Y1K1pBTmNuQ1c0RWdxUHpFWXF5?=
 =?iso-2022-jp?B?V2dxUzlEVzMycTh3eUVzNW10a1hpSXdvR3kzemxaQ29yL0tVMEN4c1VZ?=
 =?iso-2022-jp?B?c3FLZTZLUE9tcGRGRVBIRG9LVGhIbVlPcU54Qmt3MFlqLzlQYnFlUHNG?=
 =?iso-2022-jp?B?LzJIc2ZrZzI1UVlGM3Y0T08zUGE4SGtSNnpmYUZXMXBWSXEydWVJRklB?=
 =?iso-2022-jp?B?VktJU1BpUWdOU0RRR3ZXbGNoVTNjQXAxcnJ5VHJIRjFyblNUTk44c3VT?=
 =?iso-2022-jp?B?eXhkdmZmVT0=?=
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7050.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e905fc-2b53-4b1c-2548-08da194b0d39
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 10:32:15.9562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pHA5+GKU92JM4Sa1RieiwPRKMy6uNzzC306RBOxTiBZLb/IPkAw3LinTI8aRpzya/xNYb8becUKjN86QFVykultsHVP+3cx+B11YFX+UKfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4784
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Greg, > > Enable diagnostic interrupts for the A64FX. >
 > This is done using a pseudo-NMI. > > I do not understand what this driver
 is, sorry. Can you please provide more > information in the changelog text
 [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [216.71.158.38 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.158.38 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nclut-0007Pa-9J
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
Cc: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "soc@kernel.org" <soc@kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "olof@lixom.net" <olof@lixom.net>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>,
 "will@kernel.org" <will@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Greg,

> > Enable diagnostic interrupts for the A64FX.
> > This is done using a pseudo-NMI.
> 
> I do not understand what this driver is, sorry.  Can you please provide more
> information in the changelog text for what this is, who would use it, and how it will
> be interacted with.

I understand. I will add a description in the next version.

> > +config A64FX_DIAG
> > +	bool "A64FX diag driver"
> > +	depends on ARM64
> 
> What about ACPI?  Shouldn't this code depend on that?

Okey. I will make it dependent on ACPI.

> > +	help
> > +	  Say Y here if you want to enable diag interrupt on A64FX.
> 
> What is A64FX?

A64FX is a processor designed by Fujitsu.
For the sake of clarity, I will describe it as "Fujitsu A64FX".

> > +	  This driver uses pseudo-NMI if available.
> 
> What does this mean?

This driver uses the pseudo-NMI feature to perform diagnostic interrupts
for A64FX. However, I felt that it was superfluous to give this explanation
here, so I will delete this sentence.

> > +	  If unsure, say N.
> 
> No module?  Why not?

request_nmi() is not EXPORT_SYMBOL. So this driver cannot be a module.

> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * A64FX diag driver.
> 
> No copyright information?  Are you sure?

I will add copyright information.

> > +#define BMC_DIAG_INTERRUPT_STATUS_OFFSET (0x0044) #define
> > +BMC_INTERRUPT_STATUS_MASK ((1U) << 31)
> 
> BIT()?
> 
> > +#define BMC_DIAG_INTERRUPT_ENABLE_OFFSET (0x0040) #define
> > +BMC_INTERRUPT_ENABLE_MASK ((1U) << 31)
> 
> BIT()?

Okey, I will use BIT().

> > +static irqreturn_t a64fx_diag_handler(int irq, void *dev_id) {
> > +	handle_sysrq('c');
> 
> 
> Why is this calling this sysrq call?  From an interrupt?  Why?
> 
> And you are hard-coding "c", are you sure?

As mentioned by Arnd, I only called panic () at first, but after receiving
his suggestion, I decided to call handle_sysrq ('c').
This driver only supports the function that causes a panic when receiving
a diagnostic interrupt from the outside, so "c" is coded.
Also, no data is added when a diagnostic interrupt is sent.

> > +	if (mmsc & BMC_INTERRUPT_STATUS_MASK)
> > +		writel(BMC_INTERRUPT_STATUS_MASK, (void
> *)diag_status_reg_addr);
> 
> No need to wait for the write to complete?
> 
> You shouldn't have to cast diag_status_reg_addr, right?

Due to the specifications of the machine, there is no problem even
if there is no write wait processing.

I will remove constant and (void *). Thank you for pointing out.

> > +		enable_irq(priv->irq);
> > +		priv->has_nmi = false;
> > +		dev_info(dev, "registered for IRQ %d\n", priv->irq);
> > +	} else {
> > +		enable_nmi(priv->irq);
> > +		priv->has_nmi = true;
> > +		dev_info(dev, "registered for NMI %d\n", priv->irq);
> 
> When drivers are successful, they are quiet.  No need for the noise here.

I will remove the message for a successful NMI/IRQ registration.

Thank you.
Hitomi Hasegawa

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
