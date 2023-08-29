Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 231FF78C10A
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 29 Aug 2023 11:13:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qaunC-0008Pa-Sf
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 29 Aug 2023 09:13:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <misono.tomohiro@fujitsu.com>) id 1qarQw-0007k5-Sj
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 29 Aug 2023 05:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZRp+JNq0hfXPEJ+qxje6x3yRArrGNqnMTcwA5Hcp4CM=; b=WtPc+dMTvke8qfBweYCJOIa9+e
 mS5ZBPcvCi8IPJWIeEyxhNewQlfEs9sjOoztCdeQqPqKXv8Ug7uw28azpLPjQodDzgWKZdoxh6yaQ
 ngzgadBno+eI1NUWx6LoKdsRoL8zN3aW7N6TQL5aXKxoO6olXeqhdp+F/COYruwjcecY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZRp+JNq0hfXPEJ+qxje6x3yRArrGNqnMTcwA5Hcp4CM=; b=IMVkV+6ay1HZpceGJggpiexsAQ
 5JanOTozCVQzR/CAyMt2pfHLVQ5soYTRObevZVqPXcHIf8xXBdOCPf9ASx2vuw5GgR7016A7LFKQl
 q/pZRJwWqc6cFVmCOnNwXxk6Ip0ye3MNthtDbcfh6M7MswyWyzZcN3JDcUpu2eZe7Nc8=;
Received: from esa6.fujitsucc.c3s2.iphmx.com ([68.232.159.83])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qarQp-001uBo-7a for kgdb-bugreport@lists.sourceforge.net;
 Tue, 29 Aug 2023 05:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1693287507; x=1724823507;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bE4HACDolm81dXZht8VYbjjGxcv38yNeuMB/IGci0K8=;
 b=drDSGOgBICe92rMAdv60pHtpNdSFykZ2bfUW6IPQ2/RRuc2+0kFRX7j9
 vnpdrH70NtPPfOqX5xuAtbEyRbNb8fbBpIpoGv69UPTHY2W7SUZmDPjun
 /YwQ8oshbsrBUtzLjaXUMv+TMp6nERpBhQyhS19MbDRVud/OYpbLAZYMs
 al5bVoaLdhR3FFfCY/cZBB3CCPKaCEzgAf0jn9IGXvdHiqzIwEHe/2rUd
 Su3N9Mnn8bs+rM3SpzJgLUQMZL/pGm5YSH+JuNx8TZkFcUJoF6FQtXGOX
 wPA1f424Z7XRzqmK/IgsLwcUrROVHsfZVElmmmNPvoKnEeKHo/TajRjgc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="93422122"
X-IronPort-AV: E=Sophos;i="6.02,208,1688396400"; d="scan'208";a="93422122"
Received: from mail-os0jpn01lp2112.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.112])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 14:30:49 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvbkAumvkC59ei+/ZgtrCs0+grnhuHs3zMBquCCBS/n9KRzYuYZRdnLt+8+Q3mx8KRypween56POxFd2D/P3Oci4zvVULmLwSfIorEFLuDKjHG9N7S+j9CEWNN+jBrPHQktzJprXgn9XguElhcVFa8PCKD1hCphQD22VGj9szjvpvDoC08D8Ort/ZSlrFsawrLxrbhTPAlYWK6kTU+9ieHh0fuzQjJkE/cKK5UaoB9p6Bnyd176jo54I1gJTU4trVq5CLNAJc6XaVlnqVZwmGFlreoB8NA0EEb0f3Q0ZEktYpFOTBRkpIxrqTruEbBSLBucF/b6lxdOSkOES4+Y5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRp+JNq0hfXPEJ+qxje6x3yRArrGNqnMTcwA5Hcp4CM=;
 b=SbxyaRMWcmnA9lsCdMuRbuNVkhllVXM2ehrFShNznA3zhQ3MNDChEsHwdi9Ri1711isUjcERe6ckQt1reTh9ocgzkC/cKEtcxd9tn61Xy4qTqCmvOi7C5Yzv0FvrzsMBHCBnrU96Uyd/vGx8R88lg98MS+L1sD9K0asPa6aCzU6ijyDNo/bgDKhpGualU8YdrOQE7j9adn11xevzTGgVA5M2BPZG9JJMweA7WaG+Ecfp9EMZl4V3/7po79BricVEmy4QCZM5JawBmibgeZbO6JAP/RE8BiNfFFWEp0BKyhlRFlm8TnSKeNhp4EYMC2+peuCMHyzyLYD6bkuLzeXZcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYCPR01MB11025.jpnprd01.prod.outlook.com (2603:1096:400:3a8::5)
 by OS3PR01MB9547.jpnprd01.prod.outlook.com (2603:1096:604:1c8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 05:30:45 +0000
Received: from TYCPR01MB11025.jpnprd01.prod.outlook.com
 ([fe80::c8f6:466b:7013:44a8]) by TYCPR01MB11025.jpnprd01.prod.outlook.com
 ([fe80::c8f6:466b:7013:44a8%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 05:30:45 +0000
From: "Tomohiro Misono (Fujitsu)" <misono.tomohiro@fujitsu.com>
To: 'Douglas Anderson' <dianders@chromium.org>, Mark Rutland
 <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Sumit Garg <sumit.garg@linaro.org>, Daniel Thompson
 <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Thread-Topic: [PATCH v11 5/6] arm64: smp: IPI_CPU_STOP and IPI_CPU_CRASH_STOP
 should try for NMI
Thread-Index: AQHZ1qBtRZFN20P9/U2RWERQaBl3wbAAxHKQ
Date: Tue, 29 Aug 2023 05:30:35 +0000
Deferred-Delivery: Tue, 29 Aug 2023 05:30:35 +0000
Message-ID: <TYCPR01MB11025325C69AF470F2052F3B3E5E7A@TYCPR01MB11025.jpnprd01.prod.outlook.com>
References: <20230824153233.1006420-1-dianders@chromium.org>
 <20230824083012.v11.5.Ifadbfd45b22c52edcb499034dd4783d096343260@changeid>
In-Reply-To: <20230824083012.v11.5.Ifadbfd45b22c52edcb499034dd4783d096343260@changeid>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?iso-2022-jp?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZl?=
 =?iso-2022-jp?B?Y2UwNTBfQWN0aW9uSWQ9MWI2ODk4YWQtMmM1NC00YTVjLWJiY2EtMjQ4?=
 =?iso-2022-jp?B?M2M5NjBjODk5O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?iso-2022-jp?B?NGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9h?=
 =?iso-2022-jp?B?NzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxl?=
 =?iso-2022-jp?B?ZD10cnVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQt?=
 =?iso-2022-jp?B?M2IwZjRmZWNlMDUwX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9OYW1lPUZV?=
 =?iso-2022-jp?B?SklUU1UtUkVTVFJJQ1RFRBskQiJMJT8lUhsoQjtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRl?=
 =?iso-2022-jp?B?PTIwMjMtMDgtMjlUMDU6MjI6NDhaO01TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?iso-2022-jp?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?iso-2022-jp?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7?=
x-shieldmailcheckerpolicyversion: FJ-ISEC-20181130-VDI-enc
x-shieldmailcheckermailid: 48a0f5581b0e4f7f9233fe205c2dd88a
x-securitypolicycheck: OK by SHieldMailChecker v2.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11025:EE_|OS3PR01MB9547:EE_
x-ms-office365-filtering-correlation-id: 8f979f06-4f73-4b05-8741-08dba8511851
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bMcshOPirZZ04d9/M6sCiKHUY/nDxboqaxqw7PQyxOPJiJ42iJMDJ+YR/GO4wzGI7jVeHGdA2662dNGe1RrgXRvkByPrOZjQ4cEWrWerxSPO2DKLYTQRY8MyiMbYTbCm+BnhS65191BIheG1W/lsOhR97Rb84IvrJpbnxlEYS0bCl1Bv4fTr8+NaDIVRhAg1jIQNeht6HH11U+Yk2PVARRZgKlJcOm1+GcXfg9Ns0DksP+1SaFh6GcI1WY9QeL9Am7fdgDSb4MRm6pzr7ElmNZ/+8MDfbxaw/bAmG0gxvkrlfbK3BMip+fI9TZoKt75dy/UweA4o5Sg5sUDPYWfTNN1LxGmgNFkxLiC44EmwhPQC05JOFB0CUDkGthBynUif/u6fSfoQvlDzqewEOfAflNrzmurXVHPnI5xwZKOzllV+2IErwq3booMIz4BSIdEszzrvGiU38FggBeeAGP3BPLQiyAQsWd6DyZ/pD3Fy8dux8XjFPYLT1vlc0WmdTbLhHVGdcM2Iwa47Xn8fqennAR2Hw1v85dH98Y+IBoEtX3aO16YtiEQLZ6ywL3SehArf196PJh8HxI2kxJJ1bcxQsDQBXn1OacQ8bUrKsaUTaDqz5UFWZGFDKcCs1En+yQNg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11025.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(186009)(1800799009)(451199024)(1590799021)(1580799018)(9686003)(71200400001)(6506007)(6666004)(7696005)(83380400001)(966005)(478600001)(26005)(2906002)(76116006)(7416002)(54906003)(66446008)(64756008)(316002)(66476007)(66946007)(41300700001)(110136005)(52536014)(66556008)(5660300002)(4326008)(8936002)(8676002)(33656002)(85182001)(55016003)(38100700002)(82960400001)(38070700005)(86362001)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?aFNyeE9PZTZiZWFuUHQxZmQxYVJrRWJUVUEwZ1ppNFdlWGF0eEtCMm9F?=
 =?iso-2022-jp?B?eG4wTUFyd2NxaHZVMmpuYnlwU0VvQ2VXU3l1NXlMYmEwVUFBRkZpRVpt?=
 =?iso-2022-jp?B?dTdBNUNJalBKQ0IyUHIvN0dWTWZnc015Q3ZkTldvc3Bmd2lQMG5WVWNM?=
 =?iso-2022-jp?B?NVJhanR6QlVESHV6QjdHb3NDNXA5TDNLSnkzelgzS05CRTlqRjBnVkY0?=
 =?iso-2022-jp?B?ZDlqUTBtSXBJY1JlcWwyRzVZbERSODF6RVo0OUxoYUwxSm0vem13THpG?=
 =?iso-2022-jp?B?TmwvMVNyRWpGeHhoV3g3Z1NqVmlPRjBSOTdadStnUFpuaGR2V0xEdXpQ?=
 =?iso-2022-jp?B?bzZJTmlSMlozdG1tQlpJRE5rSmVCdXlsOVUrSWJlREt4M0NMNUpjQ1FV?=
 =?iso-2022-jp?B?RXlGQUxXSG5lSWhCbzByeVNEVVA0L0VJd0VpM2pSZDBzVDZ0dG1Vblp5?=
 =?iso-2022-jp?B?ODJ6ZEdKSzhCc2tqdHlkaDcxbUJrY1hrWUZncjZhdlpiTkFNR3BMT0VG?=
 =?iso-2022-jp?B?Z3BnWWc5clRrSjVYaWpOZU5tbTdLV25Lc3ExVFZYNlp2amIxT2RFYmhD?=
 =?iso-2022-jp?B?bnNSSUdLMkpDeG53d3dqZVdMMXh3M3Jiekt2V0lRSlY3WCtuQ2J2RXlI?=
 =?iso-2022-jp?B?Q3BOVzdDZHRaZi9UU0xzTHJranpveUtZeUV6dFI4VFdXSmhHbll2amRH?=
 =?iso-2022-jp?B?K2xPQi9GTW02bnRiMTdRcWZnTG41TitJdkljWmVTeHcxN2RIRUZhblNL?=
 =?iso-2022-jp?B?MlROVDdZZE1neTlRbUhVNXQvK3lnTDB3VkVWVHIrbnZwZEdua1NJTXE2?=
 =?iso-2022-jp?B?WnJPQ1B2UzNqaTg5RnNhWXA3T3IvTVJqZWxEQkVNVzltaENvb3ViSHl6?=
 =?iso-2022-jp?B?Q3dsTEF5TkF0aWJMQlRDMTdoVEhUb0pCK2pYbUF5MWxpU3BGZU9oODAx?=
 =?iso-2022-jp?B?aXB2RGJ0ajN2MFFaSWdvNVBVSUpEYlkrakRKcno4a1BsSWdRKzdWNWtN?=
 =?iso-2022-jp?B?YTNnZTlpYzIrdkd0aitOdjFtQ1c2V1huTFBDOE9ncE1hL1dRbDQ3ZTli?=
 =?iso-2022-jp?B?SlVuZW1rd09LZ2kwcGM2dkR4VjJyYVg4MFZBWTBDME9SaHhMcEFnRW5C?=
 =?iso-2022-jp?B?Q0VzZm5lcnMxMnJHSTczL3dhN0RTTlFkSDdOYU1qQjNKRklRLzNqNFVV?=
 =?iso-2022-jp?B?R3FmL0xVT0pBYUV6TzJ4RmpxSG9ENzVYU0dDeEpkT05vOHZUTWgrc1Vn?=
 =?iso-2022-jp?B?blJ4SkFOUm41MWNNSUpkREVDeE5ReW50WHZLTHI5RU45R3pjSGlCTFJJ?=
 =?iso-2022-jp?B?aGVYUDV3djhMRWsveUZBOTJldmU1YXJJWlhiR0VOOUV1MDJjaUdpS0hD?=
 =?iso-2022-jp?B?aDRicUNaa1FUNlZzTzZydWl4MlBQNGRlOTNRTFM1aUxZZ2dodi81U3N4?=
 =?iso-2022-jp?B?d1VZbVYxTm9zY3U4RTNESXJudkxtTDQrRkE0c2E1ekYrek8vdVlaKzg5?=
 =?iso-2022-jp?B?bnJibGlzRGRiam5iUjltbVVyUkpzVFRjekNRMFUyTEJsaEQ3Ky9NVzNT?=
 =?iso-2022-jp?B?QUF4TkY2U3JBUTZ5b3ZPb0RDbDhRQVRFckFkK2FCZVlNbm1HZVZGUXpJ?=
 =?iso-2022-jp?B?M3EyRFdaN2xDeXlMVm51bjVKcWphWmRNNG9LeHNnNnV5ZDhaNFBmV2t6?=
 =?iso-2022-jp?B?TFViaGRpemd3TVZSbG9GenllekpYUkN2OUFxS1YzSUZWd3E2dzBnRmhO?=
 =?iso-2022-jp?B?WnFDbWMzMVpxaEwyZ2JheUZJem10OXNrMjEyS1NTTWhXTi9YOUV6VFRl?=
 =?iso-2022-jp?B?MC9xQnNaVjVuZWV5Q2xSUCsrME51YVVVbnFUV0tCckJmM3doU2RkYjZZ?=
 =?iso-2022-jp?B?MDdteW9zeHpvU29aNWJpM2hMVFdjZzNIUWIzWXBaUzRyYm9Mb3VEa3N0?=
 =?iso-2022-jp?B?a2xqYk9uVWR6U1ZQODhveUM1Uys1amRURWtNZVkrRmgrVnBsNlVsenlV?=
 =?iso-2022-jp?B?Q3NIS3VZUWYvUDFaTGVLN1d2YUhVMUJScEdDV25JbDU2LzhDM3VJNFVi?=
 =?iso-2022-jp?B?SDFmNmJLNFV1TUxoYkxZNEFmUGdpNENEV3dvanBXb2phdFBKR3dTSHkz?=
 =?iso-2022-jp?B?c1o5Q09CZkh5a1JIVzFSR3I0cVRVdXZvYjR2UHdBUU4rR0ZHaGprQWFY?=
 =?iso-2022-jp?B?Q0pOMml4TnZOQXA5cWVvcXNITGlsVWFjOUhRcWlQREJ4aTUwb0hpdkc4?=
 =?iso-2022-jp?B?TjVHQnVrYlFZbFZGdnQwYjJWOElub3BJL2R3NXFzajV6UVJUc0IzUHFD?=
 =?iso-2022-jp?B?V2FlQjR6OVBOdWZhbFkrTldCQXJQNHZIRmc9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?iso-2022-jp?B?YmFkYWNKaXVVN0t0WlVOdGJqK2hybm1vMUdxenRuOHA0eDB3VEFVcmI1?=
 =?iso-2022-jp?B?NVhEVzlyTDgvWVdnWjFpVVNDNXp1ZTlBM2d6b0NlUG5SUW83VGFkQi96?=
 =?iso-2022-jp?B?RnFoNGxVejhtdS9LRCsyVDdGdnd2RXgrM3EybitKbURZSDRpemVwcVpv?=
 =?iso-2022-jp?B?dEMxS2U5NHNTbjk3c0tWelVJSjk1UWU3QUxyNHowVnNlVmZJQWNDQi84?=
 =?iso-2022-jp?B?Rk9zV1laTHhFTGhoclZoMHZWcHFFRHJkalJEU1BOVk51MHFEOFNxM04z?=
 =?iso-2022-jp?B?RE5jZWswRkRLMEZMaFNNRkRFeUNkaXl4ZVZUakZvVGU3MzcrOVdMakcw?=
 =?iso-2022-jp?B?NFdjRHdCdzVaZ0crOFh3N2lMV1pUWUtuRjlkb0NrTTJrRVp0Wm8yMUEz?=
 =?iso-2022-jp?B?OU5ERkRiZENOQ2VFQ3pWNXJQNmdvQy9BcEVyNmNUM1k0ZDZJNnlPaUhH?=
 =?iso-2022-jp?B?UjFPYUwrWXVuR1ZITE8zQXBzdzVVN0R1Znl1b2djWFZtZGhzaVZTNmd3?=
 =?iso-2022-jp?B?ZDBwaFBtMllvUXMybG5yTUtwWFpiaWh3VDE5cDc2OUxSbnRpMk9kTEFx?=
 =?iso-2022-jp?B?UUF5a1pvTjdWUzQ0dEoxTSt4aEl3SmhSL0JkcUZPS3UzUml5SVVVYkll?=
 =?iso-2022-jp?B?L1RwY0V6NmVUdFVCK2ZaQWF3RUR0bmpQTnBPMkQxYmpQNFBDbDJnL0hT?=
 =?iso-2022-jp?B?dVV0M0w1blJsUmxpTENsaTZvalVJcXN6eStueDZKZmZRY1RRekUvck1y?=
 =?iso-2022-jp?B?blFTb3c4czQrRjlUcVlqMHUrcWRhRFNMOVJJb0hVKzN3NWQ3VzAzUmhV?=
 =?iso-2022-jp?B?LzFKVXo4T2poYVBvQkdDRnJBTTgxRHljT1piWTZMNU5XVjF1MDhhOGtp?=
 =?iso-2022-jp?B?QTEyN0UxbmJuci96N1FlSENDZWVyM0JPZFhSWGRuZHpJUkwvLzJ1S1Fo?=
 =?iso-2022-jp?B?dlNQbmgzdlYyNVQyditwOFdnNnBOS1BBdUlXZDAxdUQzeitlUm03OVlM?=
 =?iso-2022-jp?B?NjUzQUNuNXZwaDloT09pOU1xRzhXRlVRT2h0V0Z5eUcrZm82TjRBaEQ0?=
 =?iso-2022-jp?B?UUxnQndITVpkcUJhQjRuWFRacEZSYnZiUWZWaTF4UEJybTBzNnQ4STg0?=
 =?iso-2022-jp?B?ZXA1NjVQZjNUYlJmdEsxRmgrZGwrdVVibGZYZnF4WmtHUEtzVGQ3UDFv?=
 =?iso-2022-jp?B?M09tRjdrTm5SQ1g5QUZhZHdhdjhOUjNvNHZvaGV2SE53UUtvY211N1Fh?=
 =?iso-2022-jp?B?ZDFES1ZiTzUyY1pnMG5NT1VSeVNJTGVMRUdZYkZzeFp5UUV3TXoybzB2?=
 =?iso-2022-jp?B?eU90TnBHOXd5OHJXSTNCZCtOZVhURTlDU0xpSlllYWIyWkNsZU5ZSG1l?=
 =?iso-2022-jp?B?dVZDc3hJRHZrVWZYRWFEYWg5dCszUEhlb0kyaVdzanpkcm5tY2dkZjFZ?=
 =?iso-2022-jp?B?OXpydzVCcmdlMU1qRkNZRjd3T3pHWEVMcFBaeExjUFBpWUhGb2RUblR2?=
 =?iso-2022-jp?B?Q0ZCREpSQ2xodW1VSXFkOXllbCtiem96bDQ3YnJTTzdZaDZpRXNqM3ht?=
 =?iso-2022-jp?B?WC9LRmJ5aTcvL0ZGL2ZWK3pEYk1ZZ3VCRlMyb0ZHdEtkRUFBVE9OSlZT?=
 =?iso-2022-jp?B?SkFTSzU3U0lKclM1bU9vdzFhTkZwSDR5N3FHbkk0eklPT25zaStNR1FE?=
 =?iso-2022-jp?B?VWkwbU9ORm1NT3E5Lyt5UHRsOUE2MURvSWE2ZXpyODVzMkREaWRuVWhW?=
 =?iso-2022-jp?B?K2lHb2JndnZ4cXQyanZsaFdxNVJLMy9zNFJXM3ErQ2ltUVZTRlo1N0NM?=
 =?iso-2022-jp?B?b3p4VURodzM0WTFZZlFpUkVKWG9uQ0tMR1hTVjhQQzBqK09hbHVVa1N3?=
 =?iso-2022-jp?B?PT0=?=
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11025.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f979f06-4f73-4b05-8741-08dba8511851
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 05:30:45.6594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zgqucrYWpsqjqYzKrQGG4cyKUi/Ug/TuNWT/nKx3vohkXy8XO7gVDCWdgoT/KqSPLIFCGl/vBIMUtnW/2iVKjjnxFBe7b4aDW0LiLVc2Jkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9547
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.159.83 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [68.232.159.83 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qarQp-001uBo-7a
X-Mailman-Approved-At: Tue, 29 Aug 2023 09:13:42 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v11 5/6] arm64: smp: IPI_CPU_STOP and
 IPI_CPU_CRASH_STOP should try for NMI
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
Cc: Ingo Molnar <mingo@kernel.org>, Valentin Schneider <vschneid@redhat.com>,
 "Yuichi Ito \(Fujitsu\)" <ito-yuichi@fujitsu.com>,
 D Scott Phillips <scott@os.amperecomputing.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

> -----Original Message----- 
> There's no reason why IPI_CPU_STOP and IPI_CPU_CRASH_STOP can't be
> handled as NMI. They are very simple and everything in them is
> NMI-safe. Mark them as things to use NMI for if NMI is available.
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I don't actually have any good way to test/validate this patch. It's
> added to the series at Mark's request.

For IPI_CPU_CRASH_STOP, I briefly checked that HARDLOCKUP-ed CPU
(by lkdtm) received the ipi upon crash dump request when pseudo NMI is
enabled.
  Reviewed-by: Misono Tomohiro <misono.tomohiro@fujitsu.com>

Regards,
Tomohiro

> 
> (no changes since v10)
> 
> Changes in v10:
> - ("IPI_CPU_STOP and IPI_CPU_CRASH_STOP should try for NMI") new for
> v10.
> 
>  arch/arm64/kernel/smp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index c8896cbc5327..4566934aaf9f 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -946,6 +946,8 @@ static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
>  		return false;
> 
>  	switch (ipi) {
> +	case IPI_CPU_STOP:
> +	case IPI_CPU_CRASH_STOP:
>  	case IPI_CPU_BACKTRACE:
>  		return true;
>  	default:
> --
> 2.42.0.rc1.204.g551eb34607-goog
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
