Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A21F6BB10AF
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 01 Oct 2025 17:22:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDo9g2z+53MaBIjPIuO6wL8WPuqY9rm9FYGpI32BkZA=; b=Zt8K4or4I77RF61l+qAfM+2mkW
	HeokmDt6UgUWL+Yh1W9aopT6l86BizhAul2KzhD10IuothTGM1U7tM4GyeBkPr+UuZ4zs4Q8VZ9nq
	DKiXTgU81eZjLBjQ3t90DBkqFJTANfEX98yvEennOZeQHDcHsxSC6hes3peKj7RiVlPA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1v3yea-0002fx-MN
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 01 Oct 2025 15:22:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1v3yeZ-0002fk-Nl
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 01 Oct 2025 15:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7hlptcm/EwaISWLnJu9dMyS/XTW1fEyLyqYgBYC1slk=; b=MBtYJiYtHQzrOGLdntrz3wGMEQ
 VKRednqNk3aEtbURemqf65TATk9GMu1ZQ6hGGKhFmHj35FScrVv6DhzHw0HVhYjtJS2LBE0nCH/iD
 nRh8RGcp5g8TNtRiyGivvaysRivbNBC9V/dW7sDsoUUsIeBRNhNsdXTs3rBVZoCSgLo4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7hlptcm/EwaISWLnJu9dMyS/XTW1fEyLyqYgBYC1slk=; b=hI593uioNWsDBTR3XS9TigDFCs
 SQREXOSnTBQGoqf2zv9LHtjx8pnfMp+jntYbtYQ6AUks4Fu0IAfW4QGhphTFt7vp3Wd7qhVjzym2l
 5pQCnT6pRERiCdHXhaefUOFw+WDYWK8w5wnw8X2J06AGXisvuEBtE2ROcGFQbLtIpo0k=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3yeZ-00064C-WC for kgdb-bugreport@lists.sourceforge.net;
 Wed, 01 Oct 2025 15:22:04 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1759332112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7hlptcm/EwaISWLnJu9dMyS/XTW1fEyLyqYgBYC1slk=;
 b=e05CnD+vkhPQDkJxIDWZuErtqO9n73Y5Hfn1EQBLtPL83GYpU9AT7+Hk2itplAUfpTosLE
 +SL6le0L1Jb4q+GM8ufuLMQChMLlos+baVLGkD2xMqcFlUsFeq+7Y3lK70bWmRMCTiyD15
 LYeEd3cxl6qkWeCsghotXAQmGrMYM0RB921i2+SyKJBK8EGQsD7/0soZMQneLhBpVlaooU
 uFtZ93dpLiSv7yVp2lsVtqvN0SUmLrufKpzbnq/hZHWPmUgovx60373JnnLD0HqFst7W3G
 gBNyF82Lg1uYmSxNykrSChE6FqeX1fUBfQn/n5JDqyvtutTlW9f8TYLuvFDRDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1759332112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7hlptcm/EwaISWLnJu9dMyS/XTW1fEyLyqYgBYC1slk=;
 b=7FcZZN3zpqMpzlf3b5TD/X033mENT6B3f6M0hqI2hqhNHp48t5/ezRoiUsQt/aCInLUwLy
 RIbXsCxktUMdv7Cw==
To: Marcos Paulo de Souza <mpdesouza@suse.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>
In-Reply-To: <20250930-nbcon-kgdboc-v5-5-8125893cfb4f@suse.com>
References: <20250930-nbcon-kgdboc-v5-0-8125893cfb4f@suse.com>
 <20250930-nbcon-kgdboc-v5-5-8125893cfb4f@suse.com>
Date: Wed, 01 Oct 2025 17:27:51 +0206
Message-ID: <848qhuhckw.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-09-30, Marcos Paulo de Souza <mpdesouza@suse.com>
 wrote: > Function kdb_msg_write was calling con->write for any found console, 
 > but it won't work on NBCON consoles. In this case we should ac [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
X-Headers-End: 1v3yeZ-00064C-WC
Subject: Re: [Kgdb-bugreport] [PATCH v5 5/5] kdb: Adapt kdb_msg_write to
 work with NBCON consoles
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Marcos Paulo de Souza <mpdesouza@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2025-09-30, Marcos Paulo de Souza <mpdesouza@suse.com> wrote:
> Function kdb_msg_write was calling con->write for any found console,
> but it won't work on NBCON consoles. In this case we should acquire the
> ownership of the console using NBCON_PRIO_EMERGENCY, since printing
> kdb messages should only be interrupted by a panic.
>
> At this point, the console is required to use the atomic callback. The
> console is skipped if the write_atomic callback is not set or if the
> context could not be acquired. The validation of NBCON is done by the
> console_is_usable helper. The context is released right after
> write_atomic finishes.
>
> The oops_in_progress handling is only needed in the legacy consoles,
> so it was moved around the con->write callback.
>
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
