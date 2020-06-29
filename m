Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9999820CF5A
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 29 Jun 2020 17:09:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jpvPu-0007Yu-8C
	for lists+kgdb-bugreport@lfdr.de; Mon, 29 Jun 2020 15:09:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cengiz@kernel.wtf>) id 1jpvPt-0007Yn-4Q
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 15:09:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Subject:References:
 In-Reply-To:Message-ID:Date:CC:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xrJSEuSrDGDc/mIPq73t74ckED+JFG62MfkoiO2Q4FQ=; b=D3NF00JT0KvudtBM3eTICSQE3
 cVJbCJ8UJbM6aAbiVdeQ/Rl8/I8CUac5sBT/9SOcM2t1iEfGdLMDnSwlKDZCKW0Y/oaVRQ1hTA1Q+
 i2RKygxB304VizkZWtgu1lFeVQYAjx0KBDE8zfNANFmwCq9B38tjkgxpKCh2yiM5y8duc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Date:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xrJSEuSrDGDc/mIPq73t74ckED+JFG62MfkoiO2Q4FQ=; b=jAP9aFzUMV8A6YmCwrnVhJqbEr
 zUvBOMDewWIqiSZ+Eg73EtnFGSyR9yiLxujnv4FGhjRav8Z4LchO8QsdZIDDQjFHP1Dnes+As73/7
 w/eeBysODpzKb7KUCE46pEBVK16ghgKxwFjCbOINamgH0ETNPcv5kzy9tSIFmdhxY3ic=;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpvPn-006EOE-St
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 15:09:52 +0000
X-Originating-IP: 176.55.29.121
Received: from [10.71.94.111] (unknown [176.55.29.121])
 (Authenticated sender: cengiz@kernel.wtf)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5AB16E0015;
 Mon, 29 Jun 2020 15:09:24 +0000 (UTC)
From: Cengiz Can <cengiz@kernel.wtf>
To: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 29 Jun 2020 18:09:22 +0300
Message-ID: <17300a024d0.2bfa.85c738e3968116fc5c0dc2de74002084@kernel.wtf>
In-Reply-To: <20200629145350.GC6173@alley>
References: <20200629135923.14912-1-cengiz@kernel.wtf>
 <20200629145020.GL6156@alley> <20200629145350.GC6173@alley>
User-Agent: AquaMail/1.25.0-1628 (build: 102500003)
MIME-Version: 1.0
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [217.70.183.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 HTML_MESSAGE           BODY: HTML included in message
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jpvPn-006EOE-St
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: prevent possible null deref in
 kdb_msg_write
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Thanks Daniel and Petr.

I will remove the check and submit v2 very soon.

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
