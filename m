Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB8FA0C3B5
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 13 Jan 2025 22:29:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tXS0A-0005vV-Cq
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 13 Jan 2025 21:29:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <stephen.s.brennan@oracle.com>) id 1tXS09-0005vI-7E
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 13 Jan 2025 21:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XhwaemCy2ro3YkMyVK5wxeqWFrSFIkTxZHy2YWOUdhU=; b=OZUF4/m376W+Urk4u0O9521wiz
 r8aiV9fujnw2PtmE2IlVffN2VwOPZLHZwws09tZC9YWNEZFW1HrwIeMm6uSmuYe9oU5Pg4hhyQ3/1
 sVry8H5z2MWMDvks8HxPVGZfTTxGH366SBCc7ZFT7wpZw2tzLj+Zr4w3vgoBbzax+Pts=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XhwaemCy2ro3YkMyVK5wxeqWFrSFIkTxZHy2YWOUdhU=; b=A54jgX3BTUNGxwq5IP+AczECkW
 bj57FKqbwBgBsF9mnAsWO1rozF9c5NecNBlR9328XM7VhlZabFftggKoTiaReUy33R/bUsXgyZJsc
 1v4nzSZwg+zYqafbtaZcJle9abY6XLXZz74GwQvaLRifALKnrGQSO/2D5L2ruvxQR174=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tXS08-000626-Fa for kgdb-bugreport@lists.sourceforge.net;
 Mon, 13 Jan 2025 21:29:37 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DHN3mX029568;
 Mon, 13 Jan 2025 21:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=XhwaemCy2ro3YkMyVK
 5wxeqWFrSFIkTxZHy2YWOUdhU=; b=Ha8LQ/ktgK1DYDWGctAmig7wv7ZMZVQqFl
 TOSNKZokTrvADvKOT8nZ5EKxXe/ApoOc0XZuXYXSWpwaXp/2qd6/S4e7mhBeHPmS
 4YwT/q6qKKMHfKc7tfLfMfyHOxsAzp0msBZ4MKCMB4C3ZZ7Wjfa4/VKO6s9SmhBB
 7Xdpgs2YxRtxdKsoxEdjBxYtzeFBSa0hhByx97V0p4deZGWoZKkViMQ1SM73oQoz
 CfhICGFU7PI3KuW+azgYMBxdnLBMZpRRiXshg3VcR4svZpES9Jj1Fx6msF5ekXrW
 VrFnQds4qDWp+bRQ78ahX8GbxWa8VhoHGkMzp1sX+oxKxCr5k2Tg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443gh8vf7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 21:29:22 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50DKobhc036225; Mon, 13 Jan 2025 21:29:21 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 443f3807j0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 21:29:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXmg9dhyhFvHpeCWzDPNL4ZYXtKvO+xVth+/15VEKzRhDxtfSp9DGL5zgXSIKRETfe0ECh7EbvMf8k+UKjysKXueXSENDsRH4hLOs9cffMW1FCQ7N6HAg86tNK6i4nXZHkggNsu9moLqvdpX9vf8Q+E4BQOPABWGG/5mRLh5tE9xclZLCtGRHFh4pl04loPuUWcqDEqVbKRfHwIh7xJHy99fnzwQyKJYko+GltvOPKZM43uhYNdVzhon5k8jmyUGNFw8oUdeVxa2XHSkybrMyFbbtdha8KW8Dam8lM4LqcVs8LhCLyN6qOLsQXkyeDqAoChgIh49mviuRm8R22Jyew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhwaemCy2ro3YkMyVK5wxeqWFrSFIkTxZHy2YWOUdhU=;
 b=wqxXhhd4npo/vszwfTOP5gCrppO8xqX+v2IuWUifA8E7Mm6QwqDBdoiycT8fPizLrF761/2FMLyVxsU3rK/pJyomD+ShHy9rIAIgk9V4p/We7BsyPy5hDVY7JtGlOUq7cOfi3508Nx+pq6nBhnDMmVhDHlV/MoiucKfpFRvmgzbgbPqS/4cyduaMGvFJClP1fXvdwIIqdrATEnehlEq/aDMXwKyr1UElaihpQIf1Pq0EL5W24+cMx7FZtsjH9+/pSrhvIEP4ChRdF1iAekgz5cnoRM7DVwYIYMmEpMffOnO9rS2iZTYVRXeJPJOk8FmryghwhHXBOIUrVZuCSeUQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhwaemCy2ro3YkMyVK5wxeqWFrSFIkTxZHy2YWOUdhU=;
 b=CCQ9PMatXLlAjzXpgyorNdcwrr+ptTjixrIzpKLXtsRGPlP21RL6QGURS9vMAQtUjRPKvUOUdeqBmUB5az3dDWxtiR/q8lONXuxhOEwrVbhgVoIYnZpk8guYobUqEKqmP4UZyjUXLVev52/2O8FtCU2uKtf8uwcmCx/dLv1vZzs=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SN4PR10MB5639.namprd10.prod.outlook.com (2603:10b6:806:20a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 21:29:18 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 21:29:18 +0000
To: Amal Raj T <tjarlama@gmail.com>, danielt@kernel.org, dianders@chromium.org,
 jason.wessel@windriver.com
In-Reply-To: <20250113172936.1434532-4-tjarlama@gmail.com>
References: <20250113172936.1434532-1-tjarlama@gmail.com>
 <20250113172936.1434532-4-tjarlama@gmail.com>
Date: Mon, 13 Jan 2025 13:29:16 -0800
Message-ID: <87ed16tnbn.fsf@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::23) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SN4PR10MB5639:EE_
X-MS-Office365-Filtering-Correlation-Id: e62a899b-485f-4a61-2554-08dd3419564f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?054fPQ8+bOoLPk4c5LD0LFm3X3pQU28PLfmrqg/gig2ZkeIpGFkTmUsB4qJX?=
 =?us-ascii?Q?UH7Ly4DnzPUw0f4lR1oqlqjKNWB+uMoSc8dfb8SRC135cTaH2vyktr1NnX5j?=
 =?us-ascii?Q?wGC5N9VUPMTiMWAxJHJulW75HXDUTNSe/TzfwpUzf3dAfCsXjQEQy5bAScLu?=
 =?us-ascii?Q?XXmRvVGuxY/MtQTretLkiRVHoi+gL792kwSnINMRbXnENgj6kKKAuFCdcT/n?=
 =?us-ascii?Q?Osx3+SRGoVoyAREemmLCo6geQVjsttChimO46rNUr7/mNXQvVzC7fbj5pqUN?=
 =?us-ascii?Q?dsQ2FYDosPr0QpELszpnQeWxQnlYDkujsq2BGlvqWk/WUhNcm+40Ia8/PqOM?=
 =?us-ascii?Q?L/ZxPY+V+cjWEewNZLaUP93ChDmPEPB0r1bukWUlWICPD60rT/RQ3nh+GD2t?=
 =?us-ascii?Q?EKwpAxxNnLNqQP7SWJVnamgV01tf0PaelWl7UdfQsYY2yDZwb9Po1CmdkzxB?=
 =?us-ascii?Q?9RCTzignqDZ8aA7ad4MrgHpcNc9FYAkWEM2W0YrBejghwoFZvQi584Uc6RUN?=
 =?us-ascii?Q?xTFo1zjUGSAP/pmOLWcGgMFRvRLdzSVNHCKgi20GKodtm7xykq80mous3KTU?=
 =?us-ascii?Q?2H5jouVRVEt95ScC6oIDgwmuxk4oSzhItAVGFplPnVkcHNuM8DWexHjweXf4?=
 =?us-ascii?Q?InK8jfU/X3/CG79C57Rx+CALhLlA72OlhHedcKewTc8AX3YV7gvahYHraz2U?=
 =?us-ascii?Q?pzU/ufl4ve4vlRJmLv6fwDpXR8ArJZcYk8wjt6QaKNSemBt/scyM6jyzuMQ4?=
 =?us-ascii?Q?R/Eva2nl9d/v/cnMtFQhBlQyxj4df091vgXK/7BYKuZcaQb0nTg1bJAzi4pG?=
 =?us-ascii?Q?nXdzPW+JD72hHzu7sRJJqKyFVdLY5RtHQ2GsFop/M6qqJeTyFwNS0HaHup0B?=
 =?us-ascii?Q?91tAK4F/twJYz0hAxDHv5nDKD4VqRbJHck6S/epX7gavu1sCKFnrNgLeqvbB?=
 =?us-ascii?Q?1hJRHywcXXKKMGYpgNcnJNR0FZJLYEldcd5/XotoBZSEt13e2qEGZG/SKCjG?=
 =?us-ascii?Q?uqYSQW6oaIlb/wVdbxnGI4gqRpINmPVv6f7I6fsI4e0L0dqpI80gX4gamp84?=
 =?us-ascii?Q?2Dryqb5PIFwFSd0Tz0lLWtJtThRkay3dBD4tgrlvIraFSkIHESaiwTD18cCP?=
 =?us-ascii?Q?KFgdMRIln3b2REgiufEDEvyFkluZBS/VvPQAQKaR79zl6bMY60ctwbgh1MMF?=
 =?us-ascii?Q?WbnMP1yNmDmtrPMSjKSXpnTSx8bbuKVPV5y8FApV1hEEjrYlDshw366inVzD?=
 =?us-ascii?Q?SM70nDM7hyNXYOgRlafirXq3zlWF5Vb8YBl/Sxag+N/zqmFAQkE6sP4uiqwp?=
 =?us-ascii?Q?e6W1JIwRsGSpv+G/o/3lc/SCM81Z1SJqsbyqkABcK2gm7FjhtJ3h2X2zpryw?=
 =?us-ascii?Q?LM0gp6hNnFaH/UzVCBp8A2Fn7dqq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR10MB6597.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?02Keu2xpmAHMgJaQP5viY+T1Ka4Whr7rE6j7mxR3VmLMcMfBBvZSWi/JlYZq?=
 =?us-ascii?Q?RbfuGziYSn1xdLyhn+UYYjSZOrRcl18HQ6srEo8S3TJa1lXad97J4IkWEO9r?=
 =?us-ascii?Q?RM4Na5Zln6ZDqhTqYmcdK054YqrTaOf9kDXKl48eqiLbBtBeldf3c1CQXbBM?=
 =?us-ascii?Q?28jKmT0+n8F24RExUY0hqoYPQzToKPVMM18IuwQWsgTj2BC0PfzVEklRn4sl?=
 =?us-ascii?Q?EiABtW4KnonLuI91l6w4uSi4RrYQaoisLBntC+v+r0g5rSK6CR/O/Q+zSZvX?=
 =?us-ascii?Q?d96ae2Fl/IXPHlmJNW80+cCMGdKMEWDlJe4L93InjvYza2G6UatvVsobbZ0S?=
 =?us-ascii?Q?PK85RKpJ6TUkSTP3UCi1qRA6Hhkp/687ncq3MvIix1raF9RhHYHzBKWAbuTq?=
 =?us-ascii?Q?Mf+Rv424UW9Yuqw/x3lY0Me7hceOzkmZad3W4IjRqt6bSIyglCNpVNvuc/bC?=
 =?us-ascii?Q?JUTdZepwudnOEajjOBwTZbBu5Oq/W0LuH8aw5+fT+lfqTVXOXBqD4ZTkZUQ7?=
 =?us-ascii?Q?WnPfi3tNf5zMj8EZqXheEwu0+FuQPQ0yevysnBDJWu0iCLL0QOoDQIzAoYyP?=
 =?us-ascii?Q?fHjUy7+V5zJTKhpdQ6tZnPxurqB1ipDW2VUDcnopbub9S5KWhxFZAtlFJpbl?=
 =?us-ascii?Q?qXmdTMoP2xn/xb52ChOq5nuaUtIak45bQk3DXmWq5j2DlRBJlC4O4giKQIDC?=
 =?us-ascii?Q?EnXnef7EZ4x3Obxk4VfyeyOLeRQY3PN3MjNBVqyK5a+B0mF2CieStZ8M82+E?=
 =?us-ascii?Q?n2MWBZPzWHuOvL5269P+d1bk3WIOu230yj2YVVX7vUbrmMQrgnEWNba8F16v?=
 =?us-ascii?Q?S1melpFbcnL8AzaSXcCyPmWtJXmPWnH6qgrFYFDi4uh5xT24zAdd27XUdiYd?=
 =?us-ascii?Q?t35eYMnAVTj48pyJufc91fnlLMCgaFD8jhGVwDmStd6MHop8vDQMyTJqwGZR?=
 =?us-ascii?Q?J+Pm66cBCVmzxaUEXLPAK9/VOvS54yIMrFkYuu4Ompdnl4Z3E8bCLMVwnoZ8?=
 =?us-ascii?Q?SoOr9RzJCIuJTP4uzl9fv5ddrkioR5lG1RBrcgg1y5EKfvMjwyMxq8Hfr8Qf?=
 =?us-ascii?Q?96LKOjYXMbz9oEBRIi2pO8oenF5UGknIWsjScdfWJ9A2lLjQe2+80CNSIvv3?=
 =?us-ascii?Q?BWaCHzOGrHi7vRPL03sjoA1NdmHzqCQYQ2fg9m/QwAFY//T9+gJxYGOO66vF?=
 =?us-ascii?Q?043OEiAC5+bLKDWQu79gkGy8TPmQOdI7L+dWf5EiHY+w3ISQzOOrxtePFSUG?=
 =?us-ascii?Q?3rhbASlgiA8Poa/NJkT33jZK5ns9jyUdItPRMGLIxfSldplnXNcIY613wqKJ?=
 =?us-ascii?Q?/TktBeOIcNzkPhAtfgqaA4iLDXccY3SyUkYw0iwjQRE3Sj3pdGO3tqeqL3Gu?=
 =?us-ascii?Q?KogLesBJJ5dabAuIshC/Ob3jnOIfsvkBYfFf11mdJK4TZjvkD9wFFcptOxlX?=
 =?us-ascii?Q?EdqyyS/LC7Vkl74uDUgyM+pXOlCnAUdcNDsk7dDaF7untt5v7btMZXLYypXO?=
 =?us-ascii?Q?BQFWH0Z2Ub4dkofh4gMyjjO0dFHsdMjbkp5IUzadT/HUQufzCTxrRLItbFHw?=
 =?us-ascii?Q?SJbcaQf/ILQ2ikQ/No3kzt2/2mcjoqmzKh93l5g66Ur/mO0HXiTWC5n4gAby?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 9nBqB6gmrL1QqOAo1Fh50AccTxP2XX4nuQs8YeJBqZtzPU38XG1dF4vwJdHt8vrRw1qX/5xgf2F1iZN3TM81buBidiGV4oPOqoGuJlAZGAtB7plhsYp43KQAeKDg/d7uJSYX3e9xvigmzY/dNC4/Q7Pg/Dl+AATwcf4TbG/TeQMmujLyy6ZyBHSinlXlidJRkUA42SKuu30XNFgzydnBVM9f+L2MzCtXvue0IHX04cDSMftKSSpzp6VbuOyk6evA8ZcBHKerjGzhaHjq2m5n3G++UGi38uRrqZo897HxVcJrECowHWkcyPH05iI/JSRVJ25lyhXZIFufeAGF7VsQDSNUvktCxlenPYIQ58Jn9cTdOEzZjRYjAy1R3e70njLFiOW3gXvr7SahinxcLb3zE3fgXvhANCRnE+pEQdTAjFp5WE17mMzU5Q27cIhMJLXRiyReUi1PDL/Moui7V1wZI7CMkiJAxLzPqZqhp0fny3UBcl+WUsBcWu8K+WS7EmKV+9jVsSiUbr16N8kUtejNPK3Uw4fD+A7zar09BKfWQ3nZBrsQs1o9GQwqiDuEAWsBcuHfWWyxlsZNtwXPpejlZ//nYwZMX7yVGL5vw2dzgJI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e62a899b-485f-4a61-2554-08dd3419564f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 21:29:18.5467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KYXjiaraJjPMS4aAnWWNevP97MmbcEB9+6hi2WoRn96XrxLAg3p7skHwzwRdVBjBrEq6yyo+A9528J/hicIUW7J7u39xRE9iHFG2gHjBYA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5639
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_08,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501130170
X-Proofpoint-GUID: QipJZPe3N9Z6djYAD42LJO5BBt4PKcyG
X-Proofpoint-ORIG-GUID: QipJZPe3N9Z6djYAD42LJO5BBt4PKcyG
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Amal Raj T <tjarlama@gmail.com> writes: > From: Amal Raj T
 <amalrajt@meta.com> > > The current implementation of `poll_put_char` in
 the serial console driver > performs LF -> CRLF replacement, which can corrupt
 binary data. Since kdb > is t [...] 
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
 -1.8 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.220.165.32 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tXS08-000626-Fa
Subject: Re: [Kgdb-bugreport] [PATCH v3 2/3] serial: Move LF -> CRLF
 replacement from serial console to kdb
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

Amal Raj T <tjarlama@gmail.com> writes:

> From: Amal Raj T <amalrajt@meta.com>
>
> The current implementation of `poll_put_char` in the serial console driver
> performs LF -> CRLF replacement, which can corrupt binary data. Since kdb
> is the only user of `poll_put_char`, this patch moves the LF -> CRLF
> replacement logic to kdb.
>
> Link: https://lore.kernel.org/linux-debuggers/Zy093jVKPs9gSVx2@telecaster/

Reviewed-by: Stephen Brennan <stephen.s.brennan@oracle.com>

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
