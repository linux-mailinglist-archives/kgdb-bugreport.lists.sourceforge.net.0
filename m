Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF5B512967
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 Apr 2022 04:16:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1njthY-0006Vy-Ss
	for lists+kgdb-bugreport@lfdr.de; Thu, 28 Apr 2022 02:16:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hasegawa-hitomi@fujitsu.com>) id 1njthX-0006Vr-9f
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Apr 2022 02:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t6JV6epg/EdnRPgFx2es/mvRjvehhv4gGAfajY+Yd4I=; b=ec6Xc3yjRP7SB405+Tkv0PEiel
 SoFo4qVpynKUgDNwbKvPw/R60Y9fx/dtfU0m/dtpfLeFPJbFLtUNf6OsGuS24BDsrbXOLppk8HwAi
 kQXRLWES+S+nmKwnYthwPFGCalEM1uwTCTB3Cc4MMOz1qmxFdgwMEbIoQeHmM4qESO7Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t6JV6epg/EdnRPgFx2es/mvRjvehhv4gGAfajY+Yd4I=; b=SyqzSmgSWIfSJLoUP4ePuN8sdc
 luv4ynfTAik0M6H8Raw3GYlrp3UlK2bWFughbLOPjt0sAcLoe0oTwPILbyU2aUQgXcgWyIt4u66Ev
 0qxjiAi73r18bXHv6j0Nd+EC2/QPtfMcPKU7JYMXkaxPYmdSiHeYgBYyvvYFQj58B6yM=;
Received: from esa19.fujitsucc.c3s2.iphmx.com ([216.71.158.62])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njthT-00065X-Lg
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Apr 2022 02:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1651112172; x=1682648172;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t6JV6epg/EdnRPgFx2es/mvRjvehhv4gGAfajY+Yd4I=;
 b=SuzLn4ATK4ZAYkzKllnLORmUGvsreJ6NPR49Whl3hHlNXrwTcDwhYHNb
 v5hRpZjLCXnSBL2Uc3gxvPdjAI91UA2Jy5PgI+vmTcs9cqMm0ljXRkYQo
 UVD6Sk+ygb+OLjaun6IxKNLsT/MOD4R7Aw38SBMniA2t8dJ0aZ4gLZL7Y
 TzUSZB5Rli1EkVfSRveTQ9qiC5uoCVvVorSpLtzMuJ5+gUw6u6xaik4Lx
 eww9BKI5ZQTwl0uJHudirIaSf/iJtZSMH/FD4RyV8LlCG7SO28guXmu/c
 g3Ect0Plx5egZBz6uy5SGd4fSDaOdCY79zc7IZ9B5GRXkyDpcW0lcrJ3x Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="54495986"
X-IronPort-AV: E=Sophos;i="5.90,294,1643641200"; d="scan'208";a="54495986"
Received: from mail-os0jpn01lp2111.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.111])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 11:15:55 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGhJiRlrC/n3KvYYHMsz8sNhuYXiD5AkM1IDXyRGvxq4u92D+maKF16GmiCoNBM7f5XJQ2z2MPZZht5Qc8Td8EuJLCVjdWkFs3Q9gnqky+v94SJw1NJjNJK2h8kEIkQRaBnrjRmkeHQiqWicf/cGccq68dFvXWp7qG1WcvOROB6bIUi0UqDLIPcgLUitq5+q9ad21XSRZUSv6EO0BcYlmVclIjEBMAd+K+oX7STp/GwWGNJ3CgQlPgOvbKVkfEsYWEDuAhLpN0dkTSROlW8mT7QL6plFv6uJZaFdxN1Q7PtlwQw6su4JQgH3kyjvp1rHk6hZ0CX0qOhv0J5YoJiK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6JV6epg/EdnRPgFx2es/mvRjvehhv4gGAfajY+Yd4I=;
 b=Zu4KLzM+LqDYGB06cJQ29bZY19z0V5MA065VOXuq7Jtq4bqSiJ43t0/7yA9Q8ICYWfuoc50G4i7yZsZ9cvz39PYn0PK/HUubyBRp+34aEjn7Ww3LFfqHDqjcMjp0NgPxHcdY9gUvaAq4r1LK+vZVjgGAGYeCMR1EYVc0Hw9HMlCqV0/wLvBA2NmENUumcsA14HqVzl7CqN1URRNTgLpEJob5fEN1oc9BYMj/llf5XRXPeceEMkmACSrJTIdjqk4n7i7Dzv5Ka724ShNbn4eRS+iNJq1y9t1gcp4h4ObmitigOphrpx3AgjfAxyd1tSdRvrCe8qx2XGrV/jSzQoJ7DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6JV6epg/EdnRPgFx2es/mvRjvehhv4gGAfajY+Yd4I=;
 b=X7JyuAbTSM7+n4qtxmoDF1C8690jgASGv/Tw6YHqHr5R6pJuejPfE7+hj3TlseLmNOugOfd/hMqAuBcOevVj5be2qWbW8gQq8krUOdoiZA3o/FxYKvCXAyRJfSbch/i1vAT+2B9uF2JjdiKryk+n8svg+iqK5ZWPA3sFvPZRQKA=
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com (2603:1096:604:13e::5)
 by TY2PR01MB4571.jpnprd01.prod.outlook.com (2603:1096:404:114::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.18; Thu, 28 Apr
 2022 02:15:52 +0000
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::9d45:c509:9a59:4892]) by OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::9d45:c509:9a59:4892%7]) with mapi id 15.20.5186.021; Thu, 28 Apr 2022
 02:15:52 +0000
From: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
To: Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH v3 1/1] soc: fujitsu: Add A64FX diagnostic interrupt
 driver
Thread-Index: AQHYROFUWg6uBlnqVU2NIy0zBQeT5KzZYQIAgABBxICADG27AIAADG4AgAABLwCAAAfUgIAAA38AgBDcmG6ADblsMw==
Date: Thu, 28 Apr 2022 02:15:52 +0000
Message-ID: <OSZPR01MB70504BD8347355EB51F7CCB8EBFD9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
 <YkWVTEG5oFO82GPL@kroah.com>
 <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
 <20220408133246.fyw5554lgli4olvg@maple.lan>
 <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
 <YlBE6hZHmLo9/wrU@kroah.com>
 <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>
 <20220408150202.yhn3qppqwm7wzmo3@maple.lan>
 <OSZPR01MB7050BE18BC9E8DA05C00F478EBF29@OSZPR01MB7050.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB7050BE18BC9E8DA05C00F478EBF29@OSZPR01MB7050.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2022-04-28T02:15:51.578Z;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard; 
suggested_attachment_session_id: 8a37b14a-46d1-109b-c6db-dfb2335c3d63
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d7a06d1-5fca-40b7-49a5-08da28bd04d5
x-ms-traffictypediagnostic: TY2PR01MB4571:EE_
x-microsoft-antispam-prvs: <TY2PR01MB45717A0DEA7C1697E0BBD975EBFD9@TY2PR01MB4571.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KGI6iAfLRQVTz4ozT/TZNzEYQ4svWhmVsx5PzFnfp5iXMv19EpRDkaKhGoHxMCmcMcow5O+AKkSEql/nJZ/K9fcKOmB4fh4Uwy5bI5/mXrFGT2gLaKAt6rU4/3aAHInyebKr58K82cs7TUyg4nPf8svROsy64UcsyT3wNYAjBxf5rECwL5lQiih47YjabSBP7On8VIk4LgetRmss1TVFaD188K6ziMjOkpMXejZXdQZecENP2v1JO7gRQk116cTMw3L2mzky2WxcyA17q8Fm9zRYb2Ql2UHcN+QwbtypQAbYPrgQsD4YAle+gYdmGRBwdOcpCjSwkUxDXTIuoy7zZps3i1NNE5pn7lB/5IRxw6BC1bO42ZKB4cjggrLKsTRHKZMH4j5Ip8QZ//uMzbFRQHhvFp6SdG/hW2yFUrnjOWVDeY9FPmhRlTHC829pPwVhMyM7T49gvGprafriEUg9G5Wh2CM5zfIoqqqSPoafvFoA/bG6lSXjknWbvJ1OAJabSuW2QGRbjRgFhQWgDcoA5uneUeeAeP59f02l0SHM2vyKdkOOS3fDchXx2B4c4GajAHO6PvVdquSQtC3XfWstuZDZYmvkB6jfm9jTwaCMCsW6w/TC+RnO2OXw9Tyang2zKfj8AVVm03lRG+9RUNTNShB1P82eyruBkFZToFWb+TsqsbKLL6LhFzXMRRrkw5GWcg4NIitq8BaEk50xJrXIUA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSZPR01MB7050.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(38100700002)(66946007)(82960400001)(64756008)(9686003)(66476007)(66556008)(66446008)(76116006)(8676002)(52536014)(122000001)(38070700005)(26005)(71200400001)(316002)(55016003)(5660300002)(110136005)(508600001)(8936002)(85182001)(7416002)(7696005)(86362001)(83380400001)(4744005)(54906003)(33656002)(2906002)(6506007)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?SDFRdkhsVnhnc1g2TnBsQy9pcURLUmVWckpwZkNwVHFyT0RTcTd5MCtC?=
 =?iso-2022-jp?B?Z3FnVVo2SkpvTXIyWjNKbkdwSlRDaDNDUUI2djR5eGptRWVnMUZMTEpn?=
 =?iso-2022-jp?B?bFNzS2c2Rno3Qi9YZmJjU3EzME92WWZEeHdDeWFBTVhpNGNMNUF6eUk5?=
 =?iso-2022-jp?B?RE1HNlh4WTZMdWNxenlkcTl3LzJ2MjVJS2JDMDBlVnNqdkJVaDc2aFJJ?=
 =?iso-2022-jp?B?QXJaTklGbjh3L1hCRjRKR0x5TW5MdFRDWFVqM0pJMnFJTGNycGlyaXpY?=
 =?iso-2022-jp?B?ejdJVDZmWERvQjlxTDdTUXlGS3puQ2l0N2NxSWZpTTV2NHRqejF4N0gz?=
 =?iso-2022-jp?B?REI2OEVoTDhwTGhKUXZrZlkxNjI5dlVxelRqM3d3Y1NTdmdTRVMwakk0?=
 =?iso-2022-jp?B?amtVNFE1ZHhWOVpRYXN0TlUrWEcvUzBETXRLcklQYlhxVDRoNFFMS0g2?=
 =?iso-2022-jp?B?ZktCQVhGTU53TDh5T0dTVzRtaVN6UWp3WWRZeVhzK2RPRVJGbFQwRzZx?=
 =?iso-2022-jp?B?anB0WDJuNWJGSHZHV0w1Z1FzZXhSS0pkWGJXVk1kNXpHaStzcGRPZlMr?=
 =?iso-2022-jp?B?KzgycGg0MXlzTGpWcng1T1RMa2VNNFJlaFVqZ296OFA2czk3ZlhROU9L?=
 =?iso-2022-jp?B?dER4ZzNOMk1Seml4RHh5VWM0d21nOTFlZGQ5UGxtVHEvZGFUU01yd3pu?=
 =?iso-2022-jp?B?SUV2Y3ltWGNzQnlvSTZNUjJFWXVnaGN0ZTJHVzN0U0tGZ0FFSTFVRGpp?=
 =?iso-2022-jp?B?Y0w2WDc0YUNpb0xKYzVyRnhxVTNiQjQwZCtxR0ZmL2VvemdIbGN0VkRn?=
 =?iso-2022-jp?B?MVptc3R6RThnU2RkS09reGhoNlorR0U2K0RRWS80ekpBUlZvRkFZek5J?=
 =?iso-2022-jp?B?MFd5WjJQMHlabWgwbGZ3cE9zM2NTNzZYOVR1eU8vOHBYOWkzT2NPQWpN?=
 =?iso-2022-jp?B?VUpLd0JiMmozSXFrblUwbDNQK2FaTDJWMlRJYU5TV1ZockRSOXFhUFB2?=
 =?iso-2022-jp?B?Q2RBdG8zMHVkN2E1eG1YOVZmZERweXFoTUlaTzUvVmQ0V3BjVk5hcDk1?=
 =?iso-2022-jp?B?UDFrdGlYOU9FNVU0VHA5M2FnZFpoOGd0cmJqQ1EvbXBwbkNibVBPWXVV?=
 =?iso-2022-jp?B?YmY2ZTNNVXMwRTFmZUx0NzRTVmhJVXM2VkdFZzZFenRJcjJjajEwNlZl?=
 =?iso-2022-jp?B?ak5xcXh5TkpTVjRJTlE1NWNrdkR3WWoxZG9yN1o1QnRyK0dpSENSTmV6?=
 =?iso-2022-jp?B?TWMvY0xTeGVWaDlGM0hDRWhMUkhQWkNqUTRkVFBxMEU1MkRSM25ZK0Fj?=
 =?iso-2022-jp?B?aWdMMFBNcXpYU2lxMUxoWG5CVGdRQ2QveVgzRUpqc3BDV3Q4MDUxT2Y2?=
 =?iso-2022-jp?B?T1dLb3d5NHk3RlN1NVRxYUkyK0dBdGlxQjU5TmtIR0JjUitPdWhKcUtK?=
 =?iso-2022-jp?B?dnJyS1pEOTVNZGlWUnFIaTl2UkZIMXNFdHFGTEZBeHZNbkQ3VVp6Zlg1?=
 =?iso-2022-jp?B?NlprWDBBM2NTWWNkNURnNnE3cEFpSHdINks5NGh0L2tLZWpqbEZmdkow?=
 =?iso-2022-jp?B?Vm84SGNQMTdxN2hjd3YzVU9Vd0Z2b3U5bzM0RnU5KzRyazUrcmkwaURE?=
 =?iso-2022-jp?B?blFCcVVncDZsQUgvT1dVOWMrNmdXUERjenBaVEpMaHZhMXh2UHJobG1W?=
 =?iso-2022-jp?B?bkdHU1YyVFowUExVM3ByUG15eTFBTkVLOXM5aUxzSWVKR1FuRFZTL1Iv?=
 =?iso-2022-jp?B?VWRCOERWS1JrQldSQnVveURSVGVJSk9aVWtocCthSVdVZmhYWFpuNmNZ?=
 =?iso-2022-jp?B?YXdCWFc0NThkK1dYR2FmWFVERnBYSFo3UHRSTWFPSkc5ZG51K0xVb3lo?=
 =?iso-2022-jp?B?SWJRQ3c0RElWSnRzbHlDWUNHcXI1Tzk3UzdoUERwV2V1anUrUmFidkJu?=
 =?iso-2022-jp?B?dXdQVHlQd0FPelRRSWtwVUVOc2ExSkM2RVF6Qm9vNVBMU1FaQTNEVTRk?=
 =?iso-2022-jp?B?aitvTW1hSjBCcGx0VjhkcDZnSkxGWlZtc24xdnJGNjhoK0pBR0xLZUFD?=
 =?iso-2022-jp?B?RXRJd0FLSG5rcFpqRXludGFJQUQxSi84TE9iMkJmQXZudmN3V0xGdGNp?=
 =?iso-2022-jp?B?T3pNK1BhMWo1V09tUkJWQTlxTWExbFNTdS9VSE1SL3JKSWY4THB3VzhC?=
 =?iso-2022-jp?B?WkM5NjVLK2NRWTR6c09QTTJJRkxWM1VzVzdqSjk1L1hEekZBd3ArTmlk?=
 =?iso-2022-jp?B?VE9GbHQrZUNBamtYTFJXdGRJWGxkTXhqMTFNYXREQWNGRklCejNGbGNr?=
 =?iso-2022-jp?B?NDNwM2JkOFB0UUt4bHhUNW5qMXhmK0lBdXgzb09LMmtmMlJzbGd0Y0Vi?=
 =?iso-2022-jp?B?THpsN0FERTJLRHlqQURwMzh4NWlHQXRSbGpzdDN2M0daQ09xNTdpcTl6?=
 =?iso-2022-jp?B?Z3RNYk0yakEvV0xsRWRMNkNEQVJvdFA3V0p5MEduTUFYOCtYWG0rNzlk?=
 =?iso-2022-jp?B?MSs2V21CbFlVR3hGNnFGdkZ3bjBlWWtQai9tL0MyZzQ5Y2VEZ2JOaVU2?=
 =?iso-2022-jp?B?ZXpBWkgvVT0=?=
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7050.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7a06d1-5fca-40b7-49a5-08da28bd04d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 02:15:52.0894 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3aND6LOc0JOe1clObh7qKDUQSPYLaIYP4tNuVaDq3cgSt9lTfhypnI9pcKJqH1K9z8pS2IcXPx/mrwrAHZMSOyu1KkinNSHeuInTuXAxUy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4571
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Greg, Arnd, and Daniel,
 > I understand that it is not appropriate
 to hardcode c. > How about using __setup() to add a new kernel parameter
 and allow the admin > to specify the sysrq command when booting? 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.158.62 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1njthT-00065X-Lg
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

> I understand that it is not appropriate to hardcode c.
> How about using __setup() to add a new kernel parameter and allow the admin
> to specify the sysrq command when booting?

I have received a lot of advice regarding sysrq, but after some consideration,
I would like to change to calling panic() directly as in v1 instead of sysrq.

If the administrator wants to request a diagnostic, I think they usually
expect crash with NMI like x86 and take a dump the kernel. It's not common
to handle diagnostic interrupts with sysrq now, so I don't think
it's necessary to make this driver extensible at this time.
Also, A64FX's BMC is not possible to send sideband data with the request,
so it is difficult to take advantage of the flexibility of sysrq.

If you have any comments on this, please reply.

Thank you
Hitomi Hasegawa

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
