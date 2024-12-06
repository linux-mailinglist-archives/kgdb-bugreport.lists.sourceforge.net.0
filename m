Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFEE9E7685
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  6 Dec 2024 17:57:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tJbdf-0000vW-1E
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 06 Dec 2024 16:57:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <corbet@lwn.net>) id 1tJbdW-0000vL-Jy
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 06 Dec 2024 16:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=44RstDLIBgZc6YUco4PvY/CItRXWaJSKwObpJmFLMjM=; b=JcfN6XLngP2UhU72Y0X16AD/IT
 0NrQot6+7/w+P6i7dUGe93DzMc9Wpglx3SPTHYviKpa2qYI5LeiHgwsJSwVV2ij0Akzm31IN8/arw
 g69q0rcLztKpiNYS25SGdmo3cPi8vogZamywXU8ieZKBE1SZYgy2GMMq/9Rb5rViznk8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=44RstDLIBgZc6YUco4PvY/CItRXWaJSKwObpJmFLMjM=; b=IwTKNfV1EhQgBc0CdDGfKrNE00
 eDgkKDBBZw40iGyubzMpWIZI2g3eDXlI7LlxvZm8+08R/vDwQzmPxGYAojhv7+34Lng8cMLCUdRJL
 84dFkwtX8LvCtfIzh3rPBtR3kDxD784OEYTxpV3RP99JoVKmuwXSrWdE/J7H/LRMaX/I=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tJbdV-0004L8-PM for kgdb-bugreport@lists.sourceforge.net;
 Fri, 06 Dec 2024 16:57:02 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E90EC403E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1733503111; bh=44RstDLIBgZc6YUco4PvY/CItRXWaJSKwObpJmFLMjM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NncN5IaRkCZI6HOA/CKM7MXSNWYSieCyA+mKZJTEbvJf6c8UE9O4HULgoQe3PRCnv
 6GV9VQTGwXgtaUJRd37Dqiu+GR7n9xDriZ+kBvYCIgFtjji3n0/7KGAy1PmFDTYvvc
 5oiBG6eT3O18Ka8O+98uZrg8DZSW48ZpkP9FVxUYe1guImWz4VjuuRyXePQP0oxXrh
 YGloU5YuY7+iuRjX3W0QqV1Kq6lwWIhHouiOvt4xh0f4tjE4Zo6dj8bcDiQe+6xY7L
 IrX+oWKvFxEozTPbjuOdpHtdjG2o+/qKdL3fllIVHRNumMUZJ4WOVQ4bg8vyYS3h8n
 9xoxEIoZCZVXw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id E90EC403E1;
 Fri,  6 Dec 2024 16:38:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
In-Reply-To: <20241204221720.66146-1-rdunlap@infradead.org>
References: <20241204221720.66146-1-rdunlap@infradead.org>
Date: Fri, 06 Dec 2024 09:38:30 -0700
Message-ID: <87h67gu5q1.fsf@trenco.lwn.net>
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
 > Adjust the index.rst files to follow the file movement. > Update location
 of kg [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.79.88.28 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [45.79.88.28 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.79.88.28 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tJbdV-0004L8-PM
Subject: Re: [Kgdb-bugreport] [PATCH] Documentation: move dev-tools
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
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
 kgdb-bugreport@lists.sourceforge.net, Randy Dunlap <rdunlap@infradead.org>,
 Daniel Thompson <danielt@kernel.org>, workflows@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>, linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Randy Dunlap <rdunlap@infradead.org> writes:

> Move gdb and kgdb debugging documentation to the dedicated
> debugging directory (Documentation/process/debugging/).
> Adjust the index.rst files to follow the file movement.
> Update location of kgdb.rst in MAINTAINERS file.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

So ... since these are indeed development tools, I wonder if we should
leave a reference behind in case people are looking for them there?

jon


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
