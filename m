Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHKDEELcHWpsfQkAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 01 Jun 2026 21:23:46 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE18624939
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 01 Jun 2026 21:23:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FuE248aZVgPi1ceQwX3myrmnTDRQppzG+YcJka6DNw=; b=XupVrUMr81MUiivKdEy0OwVrjp
	xBbSNJuUtY+fx/xIBkvMl3Hden/eO0SeXiheiVBFoFaP8MW70Eil7jp5s+Rqr4fiBzMPyRxgTjSFg
	cqdVOVMDv2rvQgLf/wC5ZShUQ2bE6r10eRC6DejL7kbaudaWhfIif3CYLqcJDWowPl1w=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wU8Eg-00052z-Cg
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 01 Jun 2026 19:23:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <corbet@lwn.net>) id 1wU8Ee-00052p-4U
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 01 Jun 2026 19:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QY9adMM/u6K6yRy3Qi2JoGvSNAfjPBtiJQSg1JIu6xY=; b=Cz/mNlXRW04NReMf7lPhg/0qHD
 7NtjLnIuTz7gtaOQNDfAW+CvmPpcCyqSM/8D1ivHxBpoA9rqhz5mNlDvc4JXWoGhUvSVyl/V8IDmH
 wjm4utjMwHkGIMnFEALGODmwOpB8EElqpA80Bc+sjqRop+kt976lzD5V4yUqN7QkjOqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QY9adMM/u6K6yRy3Qi2JoGvSNAfjPBtiJQSg1JIu6xY=; b=lrwOWThjl7Z6lvqnt2DbGu2ze2
 cryU2SKoJWUCjhw0d9xkdoEwKSxzWJ1EN+eJklv2+32YeRTTZS4RGPpCuFv1xu61+ENG5fYL8lTgo
 5Bkn0R3tIT2wP3cHBJSyvTgYDG6Qvm8dhnd29QAZjVmTm41KqNdHkfnq8UwbUqVlOpA4=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wU8Ec-0000T0-Sj for kgdb-bugreport@lists.sourceforge.net;
 Mon, 01 Jun 2026 19:23:40 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 776D340E49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1780340700; bh=QY9adMM/u6K6yRy3Qi2JoGvSNAfjPBtiJQSg1JIu6xY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=j/EZT8SAsjQfeC/4zQioNoDKhumWyJjp+tibzAM59DQg8H48j4kRDQXgzIDWgDHRu
 vCqICY+XWsuj1htpCnl/Sdnu5BYDjfR+5dz0dbQgkjqVBOmRO0Us9mT3DIisMwPPO6
 gCbjvQnLR6A1d3bp4XZ3HdaClDNpVgY1TlPrGpv72wt95JhO8r9xA5VS1j3pZguc//
 B8vZkAuFQMbiQTbdxPEwLtQPltgtlu0ScGUtzv/7GTbHVODw61w69Drt5EL8rrWKeY
 /7GNyjHjPtAfV6Kt/Edih7Kh9Jp3LHlYYrHKMvQitHbuYP/e2PqczBmCKmySkruocr
 30oP1vRZVJ+vQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1)
 server-digest SHA256) (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 776D340E49;
 Mon,  1 Jun 2026 19:05:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Jason Wessel
 <jason.wessel@windriver.com>, Daniel Thompson <danielt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260531140207.4114764-1-costa.shul@redhat.com>
References: <20260531140207.4114764-1-costa.shul@redhat.com>
Date: Mon, 01 Jun 2026 13:04:59 -0600
Message-ID: <87pl2a84kk.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Costa Shulyupin <costa.shul@redhat.com> writes: > Update two
 file paths that became stale when kgdb/kdb sources > were reorganized: >
 - kernel/debugger/debug_core.c -> kernel/debug/debug_core.c > -
 drivers/char/kdb_keyboard.c -> kernel/debug/kdb/kd [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wU8Ec-0000T0-Sj
Subject: Re: [Kgdb-bugreport] [PATCH v1] docs: kgdb: Fix stale source file
 paths
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
Cc: Costa Shulyupin <costa.shul@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lwn.net : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,lwn.net:s=20201203];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,lwn.net:-];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,kgdb-bugreport-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[kgdb-bugreport];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid]
X-Rspamd-Queue-Id: AFE18624939
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Costa Shulyupin <costa.shul@redhat.com> writes:

> Update two file paths that became stale when kgdb/kdb sources
> were reorganized:
> - kernel/debugger/debug_core.c -> kernel/debug/debug_core.c
> - drivers/char/kdb_keyboard.c -> kernel/debug/kdb/kdb_keyboard.c

...which happened for 2.6.35 in 2009...

> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/process/debugging/kgdb.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
