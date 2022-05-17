Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE125529E87
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 17 May 2022 11:54:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nqtuP-00035s-1Y
	for lists+kgdb-bugreport@lfdr.de; Tue, 17 May 2022 09:54:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hasegawa-hitomi@fujitsu.com>) id 1nqtuN-00035a-DT
 for kgdb-bugreport@lists.sourceforge.net; Tue, 17 May 2022 09:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3wQ0iOb9KN37dHLS8uQLqvgQEnfuAqCaKWoF5LAT9JM=; b=cg+/DmyJv1CZ34x00+6c06pWh6
 riLljk61fLfGxgTuhoK38dhdEytgBjKkqPz4VtAt+bklv7AxWEE1slaHIq2sO9mmA/TW6AWxaRcYD
 bI1XTWCnDh3x2q8NdZAnO3lCUSoyfZlNjWU5vNkRqEGoQoR8KSpcjf8W0gXCO2TIPurw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3wQ0iOb9KN37dHLS8uQLqvgQEnfuAqCaKWoF5LAT9JM=; b=ACx8S1i/d8zfbuOhbu4DGsDHTY
 OkvpZNjLzLokpyYkWZvk1CArGLTHY2qgbjbaatwW0jvbDRw4Lf1d6lZzQ7NIfo3W7e7b9dT0vN1hX
 rnewce75Et6HEK0y/OAp7Yu9U0G+cC7C8d8UahXe5BPeesXVc7Qox2//GE7wAd/8mM64=;
Received: from esa17.fujitsucc.c3s2.iphmx.com ([216.71.158.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nqtuF-003Muz-2i
 for kgdb-bugreport@lists.sourceforge.net; Tue, 17 May 2022 09:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1652781259; x=1684317259;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NSRX2Nlm9Y3LY15tyVTXm4JKBIANLNd5Dm/XFLreW/o=;
 b=alS8XBSZXsavchsZ3U5eD9l3pttyvZ+0mAxbL8y5N0CwimOf6CKQJmm3
 boLoTNUdewZhMjwEKz9bmpoTmdcWtUm/RBWL2b8xZCgibjKLrdAAJ2Xan
 QRg2+ONDN5PUQLt7/a8RP8lF5I6PJM9RNPcoSB5wpSrZ3o67b3SEWg1t1
 8nKyHxfjc8yDJintXugCT5XZYopU1VZDKvXwNl/ZpAtvX32etiqEHiPSg
 yB9RCkIBWmmLQcZ3lhZaI2XPLF3YmRIX+7+GbvciWgD2YlIHOBDVH7Viw
 /XTc/iDc6kdopNY/QPpjgGdYjJlXGwc56goaCxpWiug2bRHCgvj4gCYCq g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="55967371"
X-IronPort-AV: E=Sophos;i="5.91,232,1647270000"; d="scan'208";a="55967371"
Received: from mail-tycjpn01lp2173.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.173])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 18:54:00 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyoiQ+ZVMFW7u9GkpktbhACGKD1lrhhd+iz+8wdH53sZ48jiiK/N3t+OwwmRlhoPu6Z9bUnz5EFjBs2NMVyGIwRNKBHBTjoM/FUcOTUm6GnXfck3Xs9drDoR7dIEO5NbALv5A7T0jhqbxFoUucHyVY0wsMBeGW7AycnD3o8ipX+TB0sgIvHtnHH2jTHOfuNYdaoabEsWjDnFrHHb9ZUGdehkyenRM0Uiazo/NPOT7HW68VA8rvW76Em7zBXT7RyTi1jMmDCPS1llenuwgsfQqws6ACACRRQdfcjZuLXVQcba4YsRevcnGGHebsbRtIoddb5eZEa1Pin9x2fmHvl1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wQ0iOb9KN37dHLS8uQLqvgQEnfuAqCaKWoF5LAT9JM=;
 b=UBHfKNc0y0q1Pgtvx74B3bjZkJh9pCOqeoHVPZtmru4YOPJW/X/HEsbVilfxx3lp/J0DH4Znh8az+HeVlC+zGyhVD2QuwvSbyTR4OvNcEoXdKnUuI8Ll9Pp+vc/BbCZN1pbEOc5qmnUVdVc9F8idTrwTT7j/Wj3e+bVf8A6g/7pX2ozure5+DVs2stk3BMaBSszhAl2Es6pveapjI/94oaoC7RTRJ6n/LXv7Ejmzs9DGGlGEYHqpSPBB8zNp4LCXK29z0UzJbbyT5dormfTi2bBGver+tDzZMeq+ni2uykjjzT55K0n7ggQWeRJwuLDnWeQOhoSbJ/NoF4lAHn7SUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wQ0iOb9KN37dHLS8uQLqvgQEnfuAqCaKWoF5LAT9JM=;
 b=YmMa4/f+lc4SUQaz3MGGhEr5Z5eNrDi/arwryGbugx2wR2Ddga4GAStlmFUDpy8bNHAUNPSpSzlR8ieXayRJ/36ooll/vGgKfu6ynUgW4L6IfHyCLtXmjqqbdNhDWlOniZ9gyJlGpfuxbFRAopstYABTOf6mOFBxUxXhdwJgP6w=
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com (2603:1096:604:13e::5)
 by TYCPR01MB10246.jpnprd01.prod.outlook.com (2603:1096:400:1ef::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 09:53:57 +0000
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::9d45:c509:9a59:4892]) by OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::9d45:c509:9a59:4892%8]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 09:53:57 +0000
From: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
To: Jiri Slaby <jirislaby@kernel.org>
Thread-Topic: [PATCH v4 1/1] soc: fujitsu: Add A64FX diagnostic interrupt
 driver
Thread-Index: AQHYZP9hMqXNlfDlg0S66tEsssG4aK0ZPBEAgAmesoU=
Date: Tue, 17 May 2022 09:53:57 +0000
Message-ID: <OSZPR01MB7050C926426AF82B7ADE86B8EBCE9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
References: <20220511062113.2645747-1-hasegawa-hitomi@fujitsu.com>
 <20220511062113.2645747-2-hasegawa-hitomi@fujitsu.com>
 <48cfa0b3-0424-81bd-ac6a-d631184b71b7@kernel.org>
In-Reply-To: <48cfa0b3-0424-81bd-ac6a-d631184b71b7@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2022-05-17T09:53:57.183Z;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard; 
suggested_attachment_session_id: 331c61bf-92aa-0400-1afe-86b46ec5a034
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8d69f60-664c-4ccd-b76a-08da37eb294c
x-ms-traffictypediagnostic: TYCPR01MB10246:EE_
x-microsoft-antispam-prvs: <TYCPR01MB1024602B65761DCDB1257B924EBCE9@TYCPR01MB10246.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3X+nf0TkFeDYB+rbP6lcpf4VUK7EopKqd0QodoSObXOoUv814i/WKEfIHmnnsQldK4+cYIVU+LDzH+rk4W05Z3CvE5dgZhUl462y56wgYZwgwJiIFPeZ6OsRKwiXWC3L/z1p/efYMzIgKKOH3dtK6veo++Fi6le/HLhsG34SK0l5tcfNmvNXqXvIIZL4t6QXRu7yeWBhdUNrV/ZFX6bvSdCuR4cjwIlS/hd7fcD4f+XlXgfIcf5Zim5D3o+QOeX0smMHVzUHb7tDRFymx1yN0SFzU7b7+wTHlfJ4UX1BbdQJnWxg1x85ktbP7OIr6NIhTNNh/qWzOexCtSzi3luDj8Xt2zP2NDeFYhlFY+g6egxwVGc9MdPF1+4nycoFvmGC4abJbxKU2dHUbyIghpMwDHjdGjs9iwI8VYUdKUAzBmnpZjc7TcoRegjy6OZe7BSmNalPPw1MRhUaBTJ6W2kWwR2n2PF9XJYBhn3wS5miiGKjuqwfGyWLM6l4k9aKl9FLP2QO+offs1FkEFgsnkXVMSusIWCm4kg1FsWvjJBBkfO8rvAT4LYqxtf0ct8jOCF+6kKfkIt5YyQwM0xiegifdXzssmnViewGX+LK0dVSNdUToJrZBfMxh48i2UgO+3t/VEZoW0rZOIEsY8s330nBM2FGG8qB+qlqTbcNbC4Fl/Hbe6V/c7L45WJ8pFMvRnfIsg7616prCqfinxGHHMLWTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSZPR01MB7050.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(76116006)(86362001)(71200400001)(38100700002)(5660300002)(7696005)(66476007)(508600001)(66446008)(66556008)(66946007)(38070700005)(64756008)(55016003)(82960400001)(8676002)(83380400001)(316002)(85182001)(52536014)(54906003)(8936002)(186003)(6916009)(122000001)(6506007)(9686003)(33656002)(7416002)(2906002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?aVBDLzF4T2c3TTByUG44TFVMeDdOZDNqTmVLaEVFOFNWbHJqaWk4TzE2?=
 =?iso-2022-jp?B?K2l4KzVqVHFGQ0trblVmMU04MCttRStYYVR5MWhYMkRpOVkreUU1Z2Vq?=
 =?iso-2022-jp?B?ZndQRXBPYVN3OWRPM3ZPSGtrV2VVaGp0R2FxYVM4ZHVXRDFPaDNXVCtC?=
 =?iso-2022-jp?B?Wk94UTNoMTFISFcwTkJ5OWVaV29Ic2wzMS9ERGVZTUhpeC93Y1VWY1pn?=
 =?iso-2022-jp?B?aC84aVhhWjduR3pPOERGMmR4NktBL1gvRXFaR1hDbjVkTFRRalkxRmdm?=
 =?iso-2022-jp?B?M3NkSjVwY2dadU9KTXA0NzhFcDZUM2x2OUFUVERHenI4NDdBNWdSVDl0?=
 =?iso-2022-jp?B?alFvQ0pjNzQ2UDEvT3NQZzVPNHhzZGQ5U2ZiT1UvRU5OV2NVbzdpN0di?=
 =?iso-2022-jp?B?U1pLbGFlS2VFZDhDRUhKN2t2dmNkTUViN3M4RGwveDVHeHVUeGxpYTR6?=
 =?iso-2022-jp?B?Y2dhVWNhUFJGNSs1M0d5UUFVbHdobjh0d0IwTzNTdDF1NGhyQnlWOGd3?=
 =?iso-2022-jp?B?OW0wLzRIVm05M2xpTEhyYWZsUUwzRVZEbVg5RnpSRlRWQjlMSXBvYThS?=
 =?iso-2022-jp?B?WkZRS0k5MDlIRktETXJVaHN0b2I4L3JTa044SEFZdWpGZmpuUVdiSkd2?=
 =?iso-2022-jp?B?ZWU4d1lpMm1SVWZTY1NHZlJOcktZZjFCL01oVm1pOWVySWRJUSthclNp?=
 =?iso-2022-jp?B?NDRVTVF1bmlrR2FLelF1Ti9wbWY4MlQ5ZTBBb3hsR3ZPVkttcDMrNjI0?=
 =?iso-2022-jp?B?c3V0OUxIZTY5d1FnaXdPM2NkQ2xZeDhoYzdveWY5S0FGSEFtaE8ycE9B?=
 =?iso-2022-jp?B?UjV0N2gxdCtDZTJuSytOSE03cWQ1WXB1WUQ2eDMvY2crUk9KQTBIUzNC?=
 =?iso-2022-jp?B?eHZ1SGt6QkhuSkpJSFVpMmVNaVBmRy92Zms5cVJoQ1ErSHBvQWtBY09r?=
 =?iso-2022-jp?B?TVQ5akYvaVgyanJPaGZuWTdFVEVwQmhFKzF0M1NmNFJqQm9MVGk2emYw?=
 =?iso-2022-jp?B?YlRIak5kNnhNbHZLOXdXL1lwUS9Yc1BoMXpZNWZyajdlODVZVk5WSEsv?=
 =?iso-2022-jp?B?YnIxRmpkdjA3WWlUR2ZTejYrWHlYSU9qOERrN2ErUUtjNTJ4bENDTmQ5?=
 =?iso-2022-jp?B?MWlqMGR6NkloOG8rRXI2N1FWdDJoL3d4ektUZVRqYzZhVmxWcUlvS1JB?=
 =?iso-2022-jp?B?L1NIT002SVV4R1QzN2U0UUdUa2k4bU10OGx0akwwVVEzNjJOSE9NOWJX?=
 =?iso-2022-jp?B?Vzd2b3cxZzE3OE0zQmNyaGJUMTZQRUhybFI5aElibVFRNEQ4czBERkNO?=
 =?iso-2022-jp?B?bmYzT3E5dE85SmoyQW12WVNlWHdqWE9FbmZZU3VCeFBTbXJPSG9tandY?=
 =?iso-2022-jp?B?ays3RFBrVi9yeEdEaWsrUC9lMTFqaDVjS3NpRnM3ZHBnTzczQlkxdjl6?=
 =?iso-2022-jp?B?UCtQQjJ4QmppVlNWUTFoY3BLbFZNUlI3SWY4eWpZbmhFL2ozMUpiTWlt?=
 =?iso-2022-jp?B?QjR5aklndkdEUnZjMTh0Vm83bDRsSHpiUWFRanBpNEZBb2FyQ3I1NTRE?=
 =?iso-2022-jp?B?amN0UHFSTytvQ010Z1hEUGowbUNKSVNyaWJwY3VtTlFZYzJ4b0NNSEtl?=
 =?iso-2022-jp?B?R0xSenBOMjNJMXdCSU1hZnVsdFQvSVk0NTdXSVVMRlp0eU9SaTllWVgy?=
 =?iso-2022-jp?B?N2NTNytOaTdyOURPdXkySDFrc3FWYzhQRzdnYzhjWHNIRlN3b2x0WUNz?=
 =?iso-2022-jp?B?UDAzMEVNcjc1NWZzRHhWV3hudVlCeGM2YmMwejA2c2dPODRaamNBeS85?=
 =?iso-2022-jp?B?VmpmR3RzMW5PLzhNdTRlVkk5RGo5cUtSblczd25pUzAvZ1J4UjMvRkJD?=
 =?iso-2022-jp?B?VjR2anpqcXlpNmNiUGR4S29vWmpEdVA1bWdaekNoYnBkWG1UWG0yZ255?=
 =?iso-2022-jp?B?K0s2NDFvVlVzUHphTWF1NkxxU1E5SE90RnA0QVlVc2ptUHR4bzRYejR2?=
 =?iso-2022-jp?B?eG81WWZhV3NINnc3cUVTOFl3NHYrUTBTNWQyZlZnMmdLdzVXWUs2YjhF?=
 =?iso-2022-jp?B?ZjN0ZTJxR2dzTktwbkNrQkZxdkNqazBwaVZyOTFMTWx6dzZ3Mys4Nzg1?=
 =?iso-2022-jp?B?amVORzVsRkRrVE5YeDZ1Um5vTjhFSTc1RTVNVUlHWjdyL3JlcUhrZFhm?=
 =?iso-2022-jp?B?WW9RK24vcVN5Yi9XcDBaNk5LU2dBV09BZzNJeXF6OHYyUHNjSTJONjlK?=
 =?iso-2022-jp?B?LzFYZldCTnc0eWVJeWswS0VxeGdNY3lFRFdJQ2piTXdIeHRZeG5ydmFz?=
 =?iso-2022-jp?B?OFUxR3JnekZ1K0VQWVYvbHVCYjliZnJCMmtLVXNGQXpKbmxmZVpZcHkx?=
 =?iso-2022-jp?B?UFRaQTRUTWNPRU8rdS9na1BhT0NJRXhZOWN3WGhselhXSDRUS1ZUc2RH?=
 =?iso-2022-jp?B?ZVVQcnhJSDI1VDN2alRpTmZUTlZ6NDNLOTJwLzM4QmswNHJvMktzM25U?=
 =?iso-2022-jp?B?czR5ZitVaE94dkRQZkhBS2tuOUtJZVFzMXRqSVFkR3lPbTN1b3I4MWtv?=
 =?iso-2022-jp?B?azc0WVRVQT0=?=
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7050.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d69f60-664c-4ccd-b76a-08da37eb294c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 09:53:57.5613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qTTfKPupicAHTrqaipZppurlJvzpUSx/uz5VEpbutU71jMphz8BBL2GVmUz9AznyDRubUz3jJX/LRZTDTcEKnF8VGaftNgMcPc500fLzL6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10246
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jiri, > I'm not sure why you cc linux-serial, but anyway, 
 comments below :). I used sysrq until the last version, so I still included
 kernel-serial in the destination. I am not planning to use sysrq now, so
 I will remove it from the destination from the next version. Thank you [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.158.34 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nqtuF-003Muz-2i
Subject: Re: [Kgdb-bugreport] [PATCH v4 1/1] soc: fujitsu: Add A64FX
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
 "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "soc@kernel.org" <soc@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "olof@lixom.net" <olof@lixom.net>, "will@kernel.org" <will@kernel.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Jiri,


> I'm not sure why you cc linux-serial, but anyway, comments below :).

I used sysrq until the last version, so I still included kernel-serial in
the destination. I am not planning to use sysrq now, so I will remove it
from the destination from the next version.
Thank you for your comment.


> > +struct a64fx_diag_priv {
> > +	int irq;
> > +	void __iomem *mmsc_reg_base;
> > +	bool has_nmi;
> 
> There are unnecessary holes in the struct. If you reorder it, you drop some
> alignment. Like: pointer, int, bool.

> > +	u32 mmsc;
> > +	void __iomem *diag_status_reg_addr;
> 
> I'm not sure what soc/ maintainers prefer, but inverted xmas tree would look/read
> better.

> > +	priv = devm_kzalloc(dev, sizeof(struct a64fx_diag_priv),
> > +GFP_KERNEL);
> 
> Don't we prefer sizeof(*priv)?

> > +		ret = request_irq(priv->irq, &a64fx_diag_handler_irq,
> > +				irq_flags, "a64fx_diag_irq", NULL);
> > +		if (ret) {
> > +			dev_err(dev, "cannot register IRQ %d\n", ret);
> 
> No a64fx_diag_interrupt_disable()?

> > +		priv->has_nmi = false;
> 
> No need to set zeroed priv member to zero.

I understand. I will fix it as per your comment. Thank you.


> > +		enable_nmi(priv->irq);
> 
> Provided the above, I don't immediatelly see, what's the purpose of
> IRQF_NO_AUTOEN then?

It seems that request_nmi() requires IRQF_NO_AUTOEN.


> > +static int __exit a64fx_diag_remove(struct platform_device *pdev)
> 
> Is __exit appropriate here at all -- I doubt that.

I will remove __exit as it seems unnecessary as you suggested.

Also, I will correct BMC_DIAG_INTERRUPT_STATUS_OFFSET
and BMC_DIAG_INTERRUPT_ENABLE_OFFSET.


Thank you.
Hitomi Hasegawa 

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
