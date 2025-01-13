Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF70A0C592
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 14 Jan 2025 00:24:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tXTnX-00043p-Bd
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 13 Jan 2025 23:24:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <stephen.s.brennan@oracle.com>) id 1tXTnW-00043j-Am
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 13 Jan 2025 23:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ObbmM1BfJEFOTqBn5hMV42JrdXD8wvY26zBKaJOylpw=; b=DnJ961GQkYVBTjlMRJfWwxgIeI
 1VOSPSteHoNpN/Q8gQWasuZOdr2IKKOHlBOWMvzx6r1A60T18ETwwnh6Qq7knGCLAepzMSaNj62hv
 wbq+5xCJzWSG2/HX7rpDyAgpbfzmXTwCOsrdq7uBzJmcFJAtCiSr3Pi6/+Bfr9yKzP6A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ObbmM1BfJEFOTqBn5hMV42JrdXD8wvY26zBKaJOylpw=; b=OxyhIXkx8CYbcZJeSNUvNeUOD2
 IvCXsLgpl/zmb1eNCSyepwHGQtLiLspH5iAI7guNRX/cz2ELHasG4lqTylAt9Vqyid1BqWK4YsZRH
 lP3+RycDWUvBVuSaVwL2oaTN2ex7a2pYyDQlum6ueRrQjl1H0i/XB1rSl8UoqiTp7EcQ=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tXTnV-0003Dc-55 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 13 Jan 2025 23:24:41 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DMBB2O000308;
 Mon, 13 Jan 2025 23:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=ObbmM1BfJEFOTqBn5h
 MV42JrdXD8wvY26zBKaJOylpw=; b=osfMpWhOmPTEMozx0OWYuJ4VU8c75VEiLv
 g1p1b4yzceI16ofGSHlHbppuhc58Zl9ruIBQ6qq7W8fSvaQ1FjMiZJA2fXALOevs
 LiG7Jn7BIRkjtTk9Ln7nug/DTfFUO4F5XAT6mAl8NSl89EEB+FB+mApi3TmBx6sh
 r3iP66DXtKqIFmzPTmc4Jk5asJv/hn9PS9tW60ZK06iJBVyaREOyL7Ngo0qBplHe
 msSSKP37ulYHaE0yfFgj8bvEjLroiEVwn6iUWPU2/LNanah9nfmrgAm0pSjpGvZH
 3NKNQZQUEkjzROTVHMbO6xXp2wOt6OSLirTp5yPcD+Cqa8lEsNTw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443f7y4rsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 23:24:27 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50DLVfld037167; Mon, 13 Jan 2025 23:24:26 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 443f38421d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 23:24:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lz8QEcuHJJHzU/xP3Pi6sdiatzEfbFrJyivFqreIk1vP9pzLuilTOb5dLnokK1/jKgIojjHv3quy8mBu/hdV4Egs4hJxJjKiobGIsp+GG7Vo3uqCeTXXLht15gYxGsk/VVEcL0Jy1+ByFDU3ApHgoh6i/J0xOEYijlMQXm9h1ieWTenMAi+5i8voERHt02EN2scwCv6OR+YboCjaePOuL/ZBeY/VhdgZ+gISrneXCDje2F7/qkk7CllE9DulS0Hcl4hiib/y0zf10CPGlmHt325hva8SymI0sNrARtG95OLT/+SqBJ090rtHaGsK6pwvvEoxfA11M9pfJq2KimWUHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObbmM1BfJEFOTqBn5hMV42JrdXD8wvY26zBKaJOylpw=;
 b=a1yXd/xpVjD94zEtw+HYI7BWicMXOGQmBWk3Sm7SAPvPyWiYbhY3/JGnEc6vPx+DwVbUFOHulBL8xPwEwvBdzY2Vu9mRLegL9D4u3k+l0SmzFaiAMKUXu4/X/cuipzzQm0n4xKZ82HlPV89CYZ2YkmQOA66oz/hEbQF92zRmE/NmjIkhz93dIdt+vfJi+bEwJpvEmvU6KmBNMwiEB/rqSNBj2YgZHi7vVdhAG3I697YHwRrdBV893X9A6fRVeekEtxwI77wazjGELsAbUopnn+II6NqlyryH8KjNOTzAtRloVCR1Q0gMjw0GlaixdLUw9U37nRr/+maTkJ4g6MNy6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObbmM1BfJEFOTqBn5hMV42JrdXD8wvY26zBKaJOylpw=;
 b=t+3VgWVKGph3GDmfzwfFat9RmcHNyMIwhT4+3MOqMNcTfyFmscYvb8d3T+5LoD7SKMaamfMPn8xGCc178QgZZUXblBSZwLI1TZE0QkYWaLc9K9irbFvGx2CHXWB9f4WHxU00Kht4VMdwMOCBIQ2lRHGRN/k5Yeld9909zT8vtSY=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by CH3PR10MB7434.namprd10.prod.outlook.com (2603:10b6:610:15b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 23:24:24 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 23:24:24 +0000
To: Amal Raj T <tjarlama@gmail.com>, danielt@kernel.org, dianders@chromium.org,
 jason.wessel@windriver.com
In-Reply-To: <20250113172936.1434532-3-tjarlama@gmail.com>
References: <20250113172936.1434532-1-tjarlama@gmail.com>
 <20250113172936.1434532-3-tjarlama@gmail.com>
Date: Mon, 13 Jan 2025 15:24:22 -0800
Message-ID: <878qrethzt.fsf@oracle.com>
X-ClientProxiedBy: BL1PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::11) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|CH3PR10MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: f731709a-6b29-4199-3e12-08dd34296a7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zskm1ttbscSQIfI5a6HPmvSgL8DbhrsyMZqtbK6VEdQfzMBZw3wmktDCXge9?=
 =?us-ascii?Q?43DJAehJ/U8y9UZXeGLU3GTspgwHwAFCvwaP5jB4yBCBHn8t5F7d0sG6/pbs?=
 =?us-ascii?Q?49Lc+l06whNZWMrxVDM8awaqbuq62qE2ubKvaq6etf2sgHMRB7hEe/AkK6Zc?=
 =?us-ascii?Q?/y9Kefa0MNdKuS8EZs5Rp5ocVu1dOKE7kdeYNr6DMnieDYqEIvImBWduSNvm?=
 =?us-ascii?Q?v4HlOF4F8dwFe6MGbb+lnsCCR4L7nMKFtpJICxrXQ8TUMIwNMwWjrO5qAqO8?=
 =?us-ascii?Q?PCuFsT3V8s5fksMBk/0Ag+Kkd4RHs4PwqfLhiSfTO16YCwO1atu+c60tDpy/?=
 =?us-ascii?Q?roKkBbuZUL7Q44fCqR1HArm735GV5N/fDauCu1+r70JCoHeNTPPhBy1kjs4D?=
 =?us-ascii?Q?8yd4vPBJZXgXMJxX/2oFFCdAriu4HOfTdU3Lk5OnbmT9jH4Zp2plo3IE/4TO?=
 =?us-ascii?Q?Qn+wjg/aHaAaSlDPrDR6F3GzLj58Rq33tRdGoji7hSFKskDpfhnfTyz7VF9v?=
 =?us-ascii?Q?abKhGoB6eysGXuA1NrbjUMWsUSSRfsQJgzrJvIC110WEDIygF78Ul9jEg5vR?=
 =?us-ascii?Q?xEWILtfoMtsB+sZ5Fkwo4Amki8Ishvr79SOmetVaSXcjjzQ0OWnZzY5T9F3G?=
 =?us-ascii?Q?SJi8kfyf92rUg19wpx3hK7LObz4zreHUpx0GCs9KMXoDBbRzGFltYgd3tcxt?=
 =?us-ascii?Q?4Xp445pDAFVxFsbO11Ug+wpyEZIr6lGAlaAt5G07Y/m0UUtyVtCQlmjHGKW4?=
 =?us-ascii?Q?GOtS1SdJ5UYcAnD3+ciJrQq4TXe+QDvm20+F2W5954+bK9f9BS85JoottpjC?=
 =?us-ascii?Q?Xg9j3+9DOqYspNVpDeD52Ep8xhQfiEXcBzq3j94evcmrbF8c2NJ0cMSPt8ZS?=
 =?us-ascii?Q?mE+i3OKyEPwkOzr1keijp9MKViZdo4YfEnqGrmM1qDN1LN83v68T05FtNfku?=
 =?us-ascii?Q?mqvqndZJAIjoI/P1T7XcvNcg0BuERcsIy4NfzfbCyKQGCiGPhRzqkTad7XcW?=
 =?us-ascii?Q?6uQ31wPq5sAYhP/GN5lo6tSEcXuOdBFmum3NHcBARf8fHaQUH5ooJ4y8Ubg+?=
 =?us-ascii?Q?qDGCTMm33FMjGv0QHEX2JAY7L/pBEoF3ppDc1dSXXJSclq9xdy74na83ST8J?=
 =?us-ascii?Q?Uqdv9OuJS86+ruaLWiBsOKZYNdVOCe0YIiT634AfASvpQ93gzdtyOE6zO1+3?=
 =?us-ascii?Q?/5GVH1ds+5pmdlQF36q4re7zSBRcQDPo7BmnjY6boYWEJ5we0LxoEVGNeEN1?=
 =?us-ascii?Q?d1LpcvoSIaWUGLesHWd8lmjPw2JEAeXiW6w+WjsgCLPZBi9eAFzsrR/OApa4?=
 =?us-ascii?Q?CBOVDf4WD0413OdtOMS8jzMmEN8eeybvtO0sSrFY8KtOJ6Ovv7PdBbgXbhZu?=
 =?us-ascii?Q?zS5pQ/0mQ6M/vwmEsiphy+/GKrHJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR10MB6597.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tY6veicT+qGHVUMCpiBxR3tEVGzvfkPJ99l7Mqetj1B/fVt1/PALUpZtYkQh?=
 =?us-ascii?Q?dyY8DLK7gr/gHQZ/3eOjVE09oqSVgGIXys5bto7UFArEvY+gKAkXlBpIH/FG?=
 =?us-ascii?Q?ZabTJ9REfHYdkZnCAISz5gVxB0RyFErCUPso6Mm9IsQUG8pdQgdL9QiVgrUM?=
 =?us-ascii?Q?PGxXOsXGrRQM0EfHVX9urNilX288W/dnXpP3TyDHHQqXeNQf4yIWkxthSXcV?=
 =?us-ascii?Q?ix5+55K7bLeO7u0kmnbG8AJ3tcpnkqkR3TCSk4r/eNGdlY+IUwWyYU7sNy/P?=
 =?us-ascii?Q?a4qP/yeD8G8XMJoS07Jb6A75WBy69tQvNZ5nBZn2t9Z4Rar+i/es+rn5Fuyr?=
 =?us-ascii?Q?69Km/292xBwZ09IHnH8HNALPd4w3e/didQo7ZuyHgnLtMkxmZNx9BFKGu+92?=
 =?us-ascii?Q?PgBg9i4n78rgvPOCSy7jzSoIlK13ml2JCOxsDesC/9gPMZCD7FQaxdu2cd+x?=
 =?us-ascii?Q?wAi7IkFfdNSsVT+kc/DTvzu1oa0AaRTY2IvT5w04reF18LmP/rrVqQu5A0gT?=
 =?us-ascii?Q?Zxvr1HP62tehOQKA5bzcNdQvH6QbT1wVBMCfld4Lu3EUuXaQEiRG9RmgpC68?=
 =?us-ascii?Q?/1CewD3KY2h0Lhb/HT0V+hi83Q0BhTkNj2jh9/hCCfndxpRhyzzVVUpKa8Tv?=
 =?us-ascii?Q?EY9cDNrOV6kkqOnNw7pvtp44lFYwPzvkcn53iTixvzdjGE+8vv5F2GlmZ32O?=
 =?us-ascii?Q?OfeQmsqyjqopwgYrAZfVgwjK2j3f7owyznlhyUrGqoxRq1fV1xapFl/n2RGE?=
 =?us-ascii?Q?79zJ3fxFHnqLaTOtRkcZNkwWo2/OSsa/MBO9AhAahjKxlejTBJq9XUG+W2OP?=
 =?us-ascii?Q?wXkfqxympnuGg4555lIpUmi4gB2hUM3uaWA869+Em+O/61fiRKQ3cXmFuHnr?=
 =?us-ascii?Q?qPoM08dYOZPUyf9BMfs/e4QvvZCIl+4E/X2rJCYdrdQfeer+l0b1PgQoymzo?=
 =?us-ascii?Q?CxMs+3oNIEICbKqpcmusDA+qkcFeVdOUnwcyB1EbRANjvA7HPuWBJJ6wmCF+?=
 =?us-ascii?Q?+Vw6Y98LqmakByO1Xr+CKW57sepP6Zs0hEhjR/Aj5yF2lcCkI/8Kv9nFlcLZ?=
 =?us-ascii?Q?S++SENZL2neNeOvraoJeGcO4ESBdu6MhRzxKzkmgsvDNCf4pszDBwCXSV2pM?=
 =?us-ascii?Q?OcqZve79JAP0tTfBkG486yUAyohkbpKPtOdWHaacqPwTYVPWPD5HFF8TXY9i?=
 =?us-ascii?Q?7O3KTjE7MqhLaKEfCFat3yhraXmMyR1+81zZBQiuadQRyuSd5Kfh2b6ft/cW?=
 =?us-ascii?Q?+ub7XFQ3a9pF2i35Q7/cwFXsfs6RBjCCgjeXboLc1hOQp7C24W+ryH7+UrLb?=
 =?us-ascii?Q?Y/WSFnCSulNYPGXL5YVpt5CCD3nVI5w7WeNjsTv66I4XE6PDd/Ncauq9uRuG?=
 =?us-ascii?Q?iANkTiSxCWqg23R4+ZDyNatDbvSVOq03UiTzOsltWlHnJVdcskp55IcY7CQW?=
 =?us-ascii?Q?V7aek23Hz8Lq3n5pceCkzpwGma4TJIuISU3nRygEUEPqyJrrpLUaLPKizuIZ?=
 =?us-ascii?Q?7igMzKh7IUZ4wP9h6Um2rl/IWtyv5/VkGsAMAvKM8EPiWeTlYmrdPDlcvO9D?=
 =?us-ascii?Q?mKMfs1fNywySyCP6GxTS7zMCefOz4a2KB3QWmRKkLt66fWXYDHgdRzSwDJ0J?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: n2WC0pR5TYt61kn6IdLJq36cMcb2cDHKdfXsOp/nIed0THgufvIfOML5pLmWi0CwuNyD/vEga4A0QtzH1kZDPOzCCeDDHBtrbtGitusKuhjbMoapZnX7FSpnd9KNQxuifQNuYePEdzEB8Xt6oWLWldsoe5q7k7Ykm8rEdFmAcNJznz4gQ+atGObUoh/OZFnqOnVk0Y+JTuMpClGXHMFqOSiMXlfoGRUQtVosbJA0dt7UamCh3aNR/xfnXgLOSVQUqeovL1oYPMPQg2oHXI4q3RMTpMmCIGww48ja9wVjhF7+pw24zLUuP7ihU5gSNLmDhYpwxSS+mIN2azlU/webEi88K4tm/Qlw5j4OiPzgikrFt8FiqylevGh1oEs16hwk+zz3luFCQiiQDYLYffiBFsghsU7LZH1jVf1BRagtvl83dVQtxrPeCqQV6UGgyLiES4l+Trs1dpd8z54SdrjonyufnQCRdWXP0xpUNcya/wqXlIEXdtv5+qaHZQmrvH15erk3WL9rA6uuItCkq2WAa4jCGz7F44i/7X5Cm39HGdqSnBOGD8X3QI38NauO+P3cSplxzfZxSTmVxzUxYs/bhqxBUFiwOJkJf3jhpTS4QZU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f731709a-6b29-4199-3e12-08dd34296a7b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 23:24:24.3176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvAfZrHHhPK8ZwqACujl0fWjNn3mdQsuLj0mZA9bSLaBJGTh3AqH60xyASw2AdXpJGY95kjrnFTVcWx5NMzx8ig8NL/gttWUXqddeLqizms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7434
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_09,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501130184
X-Proofpoint-ORIG-GUID: PeJuMrJQCVOXpne7UOb6gQC_GPl-1jjU
X-Proofpoint-GUID: PeJuMrJQCVOXpne7UOb6gQC_GPl-1jjU
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Amal, There are two "PATCH v3 2/3" messages. This one's
 contents do not match its subject line, so I assume that the correct one
 is "[PATCH v3 2/3] serial: Move LF -> CRLF replacement from serial console
 to [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.165.32 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.165.32 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.165.32 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.8 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.220.165.32 listed in wl.mailspike.net]
X-Headers-End: 1tXTnV-0003Dc-55
Subject: Re: [Kgdb-bugreport] [PATCH v3 2/3] kgdb: Add command
 linux.vmcoreinfo to kgdb
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
From: Stephen Brennan via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: kgdb-bugreport@lists.sourceforge.net, amalrajt@meta.com,
 linux-serial@vger.kernel.org, tjarlama@gmail.com, osandov@osandov.com,
 linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Amal,

There are two "PATCH v3 2/3" messages. This one's contents do not match
its subject line, so I assume that the correct one is "[PATCH v3 2/3]
serial: Move LF -> CRLF replacement from serial console to kdb".

Thanks,
Stephen

Amal Raj T <tjarlama@gmail.com> writes:
> From: Amal Raj T <amalrajt@meta.com>
>
> The current implementation of `poll_put_char` in the serial console driver
> performs LF -> CRLF replacement, which can corrupt binary data. Since kdb
> is the only user of `poll_put_char`, this patch moves the LF -> CRLF
> replacement logic to kdb.
>
> Link: https://lore.kernel.org/linux-debuggers/Zy093jVKPs9gSVx2@telecaster/
> ---
>  drivers/tty/serial/serial_core.c | 2 --
>  kernel/debug/kdb/kdb_io.c        | 2 ++
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> index 74fa02b23772..8e702f3deffb 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -2738,8 +2738,6 @@ static void uart_poll_put_char(struct tty_driver *driver, int line, char ch)
>  	if (!port)
>  		return;
>  
> -	if (ch == '\n')
> -		port->ops->poll_put_char(port, '\r');
>  	port->ops->poll_put_char(port, ch);
>  	uart_port_deref(port);
>  }
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 6a77f1c779c4..43a7c8ad741a 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -572,6 +572,8 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  	len = msg_len;
>  
>  	while (len--) {
> +		if (*cp == '\n')
> +			dbg_io_ops->write_char('\r');
>  		dbg_io_ops->write_char(*cp);
>  		cp++;
>  	}
> -- 
> 2.43.5


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
