Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 316B6218882
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  8 Jul 2020 15:09:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jt9oz-0000cz-VT
	for lists+kgdb-bugreport@lfdr.de; Wed, 08 Jul 2020 13:09:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <james.qian.wang@arm.com>) id 1jt2KS-0004DC-1O
 for kgdb-bugreport@lists.sourceforge.net; Wed, 08 Jul 2020 05:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lXY8310WrBa1OIFy0+8YHD/vsejg15RPJL0nGSe21Hc=; b=Jh/MzTR4YkLA3WwplKt3jKjk6m
 b6nj4yFwC+DjPK/O/9qOs5jojupuRY8cT+/mDoGSDHybTqaqakJ3iWtZlcd2zgTCSX2jeaWrynfPW
 8OKv5/BftT9eX6g0rIUslB1qfjMJVtaqC6EQBkqka3wBLxBIMWBHAgj2EB0WYeF9H65U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lXY8310WrBa1OIFy0+8YHD/vsejg15RPJL0nGSe21Hc=; b=Kv/xrAQ3eDmQS/XTM8+UNEAkzU
 K3uNvav+BU/+a+qBZeIqfmQ2mSL/2eL28hOC+rSrqF743bXe/RZJmLOZycpPKd+/mcUheqbVNSTEH
 TEh/PmNXXeYIVCWsrZO/sH1WTHxeK12t7Bb8Y+G5S/vibSyB4pjnDRtw3Pf3NRXBTJGk=;
Received: from mail-eopbgr80043.outbound.protection.outlook.com ([40.107.8.43]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jt2KL-00ArtQ-Dv
 for kgdb-bugreport@lists.sourceforge.net; Wed, 08 Jul 2020 05:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXY8310WrBa1OIFy0+8YHD/vsejg15RPJL0nGSe21Hc=;
 b=LdZVkyZHffRY3zc8d7PkEH6Er4IMXnRtIH2vKa84vfGU2JhoCHYliZPltpjD5l7/WTbbeUvornNRn3JJyNn6zTCswY9A1QCbLePCS0zoypRVMVm9Mluf4/7lbXWySIfkrbxP2If3jfxaUF1eqOqAlPqzLkGcarHkvm98Ah+ROBA=
Received: from AM5PR0601CA0045.eurprd06.prod.outlook.com
 (2603:10a6:203:68::31) by VI1PR08MB3469.eurprd08.prod.outlook.com
 (2603:10a6:803:8a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Wed, 8 Jul
 2020 05:08:40 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::92) by AM5PR0601CA0045.outlook.office365.com
 (2603:10a6:203:68::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Wed, 8 Jul 2020 05:08:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.sourceforge.net; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.sourceforge.net;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Wed, 8 Jul 2020 05:08:40 +0000
Received: ("Tessian outbound e44de778b77e:v62");
 Wed, 08 Jul 2020 05:08:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 31c59d195aa7f0dc
X-CR-MTA-TID: 64aa7808
Received: from 2e5d9e7d8353.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 06FC9AB5-E7E5-4261-865C-0C530ED94E38.1; 
 Wed, 08 Jul 2020 05:08:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2e5d9e7d8353.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Jul 2020 05:08:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtUjxmWFlhOqgMKTTCk0ej+2KO2YVuvGrBQd6zpxtJ5JbtVd67CWNwutBuzVp0FRS4JY9Lu/SJOzZwGwi4PnHgNb03wgKkjohPtJUi4786G09q2tsuZbb/te7vNLas0R+qhQqI2oIwJn35Dron8NJJwa4gQo3gmLHSfim3LOOy5DqKy9oSrUFNpKSzkpZZ+GlVG6sTF/h6LmIKAaAlc9UFR3OnSnk5MI/HY/FKA0S9zKzMBFd/pYYwDNleFam4wSctNqnyoG20qpXBeeAxIaI5vGMhBATIqruTaFqmowuZbmV31lOCEISp/l5exmIvFQzSJXOcqTMcTl2/d9MT9Lgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXY8310WrBa1OIFy0+8YHD/vsejg15RPJL0nGSe21Hc=;
 b=Vo4fp2KvVUc7u7E6caIyjBGj20AuBQk1aIvjntJwAYH47rP/Jxj2R87rcj+nsyyzPmaConDnUVdWbzB7kJALGUE29LwvOtDGGvAY2QGJIvLOd3hHGQ9n+I/p8bOp0GQR8wapf2BUu3DpwBxsKap5dXhfKQwEqMQKR7cmt3Wo3dmM/m1DYKNW/MPByusFBiwEjf4jrA8ja8SflGoLSoz55GsOYtmH6xCh27KqhMdCKQLitURgCYPjK71i4GBXjeZTohLm979ywqmgNA2BeR7f0lIdAezYXjBJmsQyiGiD3+wYhKHDA4h3oFe9bcT7haEIjDV8agjcor5Us9kOCtwH9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXY8310WrBa1OIFy0+8YHD/vsejg15RPJL0nGSe21Hc=;
 b=LdZVkyZHffRY3zc8d7PkEH6Er4IMXnRtIH2vKa84vfGU2JhoCHYliZPltpjD5l7/WTbbeUvornNRn3JJyNn6zTCswY9A1QCbLePCS0zoypRVMVm9Mluf4/7lbXWySIfkrbxP2If3jfxaUF1eqOqAlPqzLkGcarHkvm98Ah+ROBA=
Authentication-Results-Original: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org;
 dmarc=none action=none header.from=arm.com; 
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com (2603:10a6:4:3a::18)
 by DB8PR08MB5418.eurprd08.prod.outlook.com (2603:10a6:10:116::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Wed, 8 Jul
 2020 05:08:27 +0000
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::7d48:27e3:a154:17ef]) by DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::7d48:27e3:a154:17ef%12]) with mapi id 15.20.3153.030; Wed, 8 Jul 2020
 05:08:27 +0000
Date: Wed, 8 Jul 2020 13:08:21 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20200708050821.GA1121718@jamwan02-TSP300>
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-7-rdunlap@infradead.org>
Content-Disposition: inline
In-Reply-To: <20200707180414.10467-7-rdunlap@infradead.org>
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To DB6PR0801MB1719.eurprd08.prod.outlook.com
 (2603:10a6:4:3a::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (203.126.0.111) by
 SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Wed, 8 Jul 2020 05:08:26 +0000
X-Originating-IP: [203.126.0.111]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: db68b0f1-8970-410b-77d6-08d822fcfaa3
X-MS-TrafficTypeDiagnostic: DB8PR08MB5418:|VI1PR08MB3469:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB34692761FBAEB275071733CAB3670@VI1PR08MB3469.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Ugv76lIcWFzncaE8CL8NRcn6Y25zj4XaFHTLySKgaHoOkaWTWq9Qj9ZZhP0IJzeMVS1pPW9l3z9+9dwd3xUldiqi+o7oxY0AOqdkDPPHERIhDyC2SNjRnrLpm6iYobnss+uIxhuvfEryWIeZylCaITi7KP5y54tSmWIY2DME7iiFTGMCou1LWfo5Sx9h54U2HnAzztC+7i/KxuFyqyRcfH0cxR/1YKdDobyrQxHxNwVAQ5jUFJOlNXS36ebm775MNWRYWv3kdjf2/invGaF++KMpE2wNwFXFrO9cg1P8v8v1RCprlSrRLlDlNzS6KVHZRGjK0s1jpIMzdiZyoGPiNQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB6PR0801MB1719.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(7916004)(39850400004)(396003)(346002)(366004)(376002)(136003)(478600001)(186003)(7406005)(9686003)(2906002)(7416002)(7366002)(6916009)(54906003)(8936002)(6496006)(52116002)(4326008)(316002)(33716001)(956004)(1076003)(6666004)(83380400001)(8676002)(16526019)(33656002)(26005)(86362001)(6486002)(66556008)(66476007)(66946007)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: cbkH8aJ+VUJQNAYUsDp271bZLTF9bRsCKaYGBd3fSkjP/IVDmSUfCWoIVjMV00+V8zEh4kZ3pmIpL1u53ce11rKnQjfGIVmzmZ3GUtSRRteRb6x/qYqIW2lXJKMjl11L9YpRW0e/YLWSiU8X9Tq7dmlfMZHPOLSBn3CRoEJ5X/2jt1eF+V8EaJZFdp785bZA5B5+o9ocL5EkUAxXsDBuv2TmBgzekPUHt+NUqXeagtZMSNfnCZLf/bbvm+qrplQMutZ1irKbQLFnErk4jDNLuUX8DcJGqP8nHL/j24c89Z6FfJ42q/uN/6HFIOWBuJj2jpyYx/9dVVUidbMOT5qe7bCmyjy3C79wynuMO3rVlav6A7FjUcb2tHg+CI4PflCHdF6RfwnKnBwy+MQpm6yyzRv1s1n4sWYtBi1BH7pEuC+waX0qJVyLIFbKC2Dy8T0Bng/8w+kAIzGeNxNDHToKvpsXjxdPadN2moIcftwpV38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5418
Original-Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(7916004)(4636009)(39850400004)(346002)(396003)(136003)(376002)(46966005)(478600001)(81166007)(186003)(16526019)(8936002)(6496006)(82310400002)(70206006)(54906003)(956004)(6862004)(5660300002)(70586007)(83380400001)(1076003)(316002)(6486002)(36906005)(356005)(4326008)(82740400003)(6666004)(9686003)(33656002)(47076004)(26005)(8676002)(336012)(33716001)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5ffebe40-5e4a-44cc-93c2-08d822fcf283
X-Forefront-PRVS: 04583CED1A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YGuLJ8IGLKDGiszmpmG7qskMioeWapkZ4LnlujAlVbJMAMQemKyNc+F80b9pTiUAFShko01+M20wr7PTN9e5TjUI74hGhYK+XlVI9nyhlWNLfL2JMK8jsEQWTAaKJkbM54z3b3Vx1JHZ5A0BKZZ0+C/BgycQvLjE36hZq6EJWG6oZSH4C+Gp6HBurXZXvtMSzKLx1PtbhpltzOB8TGx7hZugMfC3Kew3Aeylkdtmo+KX1ZMkHbd8wnUni3W9dkJ7zk34TCp78LyE47BmAHKVjnyqGvUkkTBpRcjqlBHLFI1V/rCV9N09oM87J3YmB2ZT9J+KESeMYA2gQICHVSAAF5rTwTLxLkij2Khcs5jDI0Bt/sq/5jLzVXkc5xjgEz5fMOhW+xakjeylI7oi6zP8Hg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 05:08:40.4225 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db68b0f1-8970-410b-77d6-08d822fcfaa3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3469
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.8.43 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jt2KL-00ArtQ-Dv
X-Mailman-Approved-At: Wed, 08 Jul 2020 13:09:06 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 06/20] Documentation: gpu/komeda-kms:
 eliminate duplicated word
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 kgdb-bugreport@lists.sourceforge.net, linux-fpga@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Mali DP Maintainers <malidp@foss.arm.com>, linux-input@vger.kernel.org,
 Derek Kiernan <derek.kiernan@xilinx.com>, linux-mips@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-mm@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, nd@arm.com,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jason Wessel <jason.wessel@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Randy

On Tue, Jul 07, 2020 at 11:04:00AM -0700, Randy Dunlap wrote:
> Drop the doubled word "and".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: James (Qian) Wang <james.qian.wang@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> Cc: Mali DP Maintainers <malidp@foss.arm.com>
> ---
>  Documentation/gpu/komeda-kms.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200701.orig/Documentation/gpu/komeda-kms.rst
> +++ linux-next-20200701/Documentation/gpu/komeda-kms.rst
> @@ -41,7 +41,7 @@ Compositor blends multiple layers or pix
>  frame. its output frame can be fed into post image processor for showing it on
>  the monitor or fed into wb_layer and written to memory at the same time.
>  user can also insert a scaler between compositor and wb_layer to down scale
> -the display frame first and and then write to memory.
> +the display frame first and then write to memory.

Thank you for the patch.

Reviewed-by: James Qian Wang <james.qian.wang@arm.com>

>  Writeback Layer (wb_layer)
>  --------------------------


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
