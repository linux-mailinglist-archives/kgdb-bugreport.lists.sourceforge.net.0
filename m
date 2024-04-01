Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C4C8936DF
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Apr 2024 04:18:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rr7FX-0001bX-7y
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 01 Apr 2024 02:18:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liu.yeC@h3c.com>) id 1rr7FV-0001bH-7A
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 01 Apr 2024 02:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XaikyVQs5EJGZ8CGtdMMdgUqWK86PcrEdVmxt1j3bwg=; b=Bw3bW83w5ilEn8Kv1gTH1xcH5I
 nuDF9o47EoKWvPNe9PrhSlRC25SocAJlUB5QPmNhbDmIaihkJaInj1+TSV3za2COO5VSc1FMDRXkH
 HcIjl0khchBUNQd6JmrUVvAievKbTiJXW4dT6BKEzysBPKKREv5xWEX+4Mh3Dzc1n/yg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XaikyVQs5EJGZ8CGtdMMdgUqWK86PcrEdVmxt1j3bwg=; b=Q
 Oyxu7UC6J4ozFc5izQClVI4+HpHMbaIO+n4mPM2XRx9/QA5HtWwyv3qrtDsCMS5LItQc2zXaEh6Aq
 HBPWWAjIsQKomM3JiiXatp5ssoJXsVIaKdZuj6RDCDOI+M2dinZejScxpjBUcxR4PL1M13HmgKdD1
 WPfPCll94545Z0+I=;
Received: from smtp.h3c.com ([60.191.123.50] helo=h3cspam02-ex.h3c.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rr7FS-0000Is-SV for kgdb-bugreport@lists.sourceforge.net;
 Mon, 01 Apr 2024 02:18:13 +0000
Received: from mail.maildlp.com ([172.25.15.154])
 by h3cspam02-ex.h3c.com with ESMTP id 4312H1be015188;
 Mon, 1 Apr 2024 10:17:01 +0800 (GMT-8)
 (envelope-from liu.yeC@h3c.com)
Received: from DAG6EX08-BJD.srv.huawei-3com.com (unknown [10.153.34.10])
 by mail.maildlp.com (Postfix) with ESMTP id B6F9F200BBEF;
 Mon,  1 Apr 2024 10:18:57 +0800 (CST)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) by
 DAG6EX08-BJD.srv.huawei-3com.com (10.153.34.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.27; Mon, 1 Apr 2024 10:17:02 +0800
Received: from DAG6EX02-IMDC.srv.huawei-3com.com ([fe80::4c21:7c89:4f9d:e4c4])
 by DAG6EX02-IMDC.srv.huawei-3com.com
 ([fe80::4c21:7c89:4f9d:e4c4%16]) with
 mapi id 15.02.1258.027; Mon, 1 Apr 2024 10:17:02 +0800
From: Liuye <liu.yeC@h3c.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Thread-Topic: [PATCH V7] kdb: Fix the deadlock issue in KDB debugging.
Thread-Index: AdqD2hPGLsWNTqu4Qy+z4NFD9ArrsQ==
Date: Mon, 1 Apr 2024 02:17:02 +0000
Message-ID: <ebd5ce38abfd435886d526d4488db9ee@h3c.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.114.188.68]
x-sender-location: DAG2
MIME-Version: 1.0
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam02-ex.h3c.com 4312H1be015188
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Daniel, How about PATCH V7. Thanks. 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1rr7FS-0000Is-SV
Subject: [Kgdb-bugreport] =?gb2312?b?tPC4tDogW1BBVENIIFY3XSBrZGI6IEZpeCB0?=
 =?gb2312?b?aGUgZGVhZGxvY2sgaXNzdWUgaW4gS0RCIGRlYnVnZ2luZy4=?=
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
 <kgdb-bugreport@lists.sourceforge.net>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Daniel,

How about PATCH V7.

Thanks.

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
