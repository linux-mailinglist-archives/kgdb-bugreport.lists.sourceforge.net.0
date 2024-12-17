Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7099F583F
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 17 Dec 2024 21:56:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tNece-000654-LX
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 17 Dec 2024 20:56:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <corbet@lwn.net>) id 1tNecd-00064y-9b
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 17 Dec 2024 20:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Af2KRLSoFf+h0DNrrfx2oP5nBa7sAKsH5w+CNA5GRKA=; b=YyiJHIou/+n/CxQPzrw3aDLGiU
 E/pVazForrPht1MjNghFus+kovbwsOjPAeJTnJ5VKjqKhAniWTuC0mU5DMGdDQBgetNaIsZ6Kz1y1
 NuH5XDad1dvViRbexAObZhLn6nkax9F0Xp40prJUZ0SQbxfxz1xkV6CtflRPfoND2qYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Af2KRLSoFf+h0DNrrfx2oP5nBa7sAKsH5w+CNA5GRKA=; b=a+IsAHs+LheRL83jmg74r3788J
 I66eRqopUNH3d2pO8UHSXgi0tEAuI2VSVuAO0d1gqwn9JaMfJmU30wp5JO30Eu0KmU5J9DB+hynXN
 SokzvuIlEdlZFra3MKMUgNgpa6Bheox60G7BkvxnW52hUjLHOi6vPR6rCRHayX+7L1p4=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tNecb-0007mV-UZ for kgdb-bugreport@lists.sourceforge.net;
 Tue, 17 Dec 2024 20:56:50 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 14D7B4040A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1734468999; bh=Af2KRLSoFf+h0DNrrfx2oP5nBa7sAKsH5w+CNA5GRKA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FhFChqsVo58DDf/5cU6Ond1qs+My1/peYw3PcMt/6HdMjBhnMUY7lzhZwkoknrAG6
 90tt7cwenOllriVj5vsBXdmZfbhyDBcZ8+M4AAGmV4ItbCrAOe1nDPEw7FeYZYxdfw
 To0mMBH57OOqNrhd8VWL+Rx3AV4b4ZLqeA3ZkAhJ6h5IcduvATIuwhqSCNev5Qvwyc
 idPT7Qps3EC7JcfYtWJ9lGYTRX3QEqwJEsaiYmug9R447qHKdAYv3g7HKYi/fqmD/z
 E3KVQpx+wdhkgEL3w6t4AlS0Wvmfvi1hxtzcUHJoULwZ88vqQe9g9btWR64NoOvOAZ
 MwBmCfcN9k9Gw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625:67c:16ff:fe81:5f9b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 14D7B4040A;
 Tue, 17 Dec 2024 20:56:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
In-Reply-To: <20241210000041.305477-1-rdunlap@infradead.org>
References: <20241210000041.305477-1-rdunlap@infradead.org>
Date: Tue, 17 Dec 2024 13:56:38 -0700
Message-ID: <87seqmt4e1.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Randy Dunlap <rdunlap@infradead.org> writes: > Move gdb and
 kgdb debugging documentation to the dedicated > debugging directory
 (Documentation/process/debugging/).
 > Adjust the index.rst files to follow the file movement. > Adjust files
 that ref [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [45.79.88.28 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.79.88.28 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.79.88.28 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tNecb-0007mV-UZ
Subject: Re: [Kgdb-bugreport] [PATCH v3] Documentation: move dev-tools
 debugging files to process/debugging/
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
Cc: linux-serial@vger.kernel.org,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net, Randy Dunlap <rdunlap@infradead.org>,
 Daniel Thompson <danielt@kernel.org>, workflows@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Hu Haowen <2023002089@link.tyut.edu.cn>,
 Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>,
 linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Randy Dunlap <rdunlap@infradead.org> writes:

> Move gdb and kgdb debugging documentation to the dedicated
> debugging directory (Documentation/process/debugging/).
> Adjust the index.rst files to follow the file movement.
> Adjust files that refer to these moved files to follow the file movement.
> Update location of kgdb.rst in MAINTAINERS file.
> Add a link from dev-tools/index to process/debugging/index.
>
> Note: translations are not updated.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: workflows@vger.kernel.org
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <danielt@kernel.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: linux-debuggers@vger.kernel.org
> Cc: kgdb-bugreport@lists.sourceforge.net
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Alex Shi <alexs@kernel.org>
> Cc: Hu Haowen <2023002089@link.tyut.edu.cn>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-serial@vger.kernel.org
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Daniel Thompson <danielt@kernel.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Applied, thanks.

jon


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
