Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E574FB45AFD
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 Sep 2025 16:52:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXN4n34yce6r7sBLzeVtPJIBDCR1B+hYfSwbxufKhsQ=; b=CtNqx3U8SsNmKh9f7Y/8MK8T70
	ah8cFQA4Upy2W7fgiZBNtxN2LE4x9pVenQ7tyFdg4L2pMlHESxL+f2rEaLiVU1sOTRmLfQ9f2EPDU
	XH+oaFk6uUCi6r7c+P4JCgeT+BdiH5CGXuybKfZyvaNFd+1hTInxCjShPWHGFEaJeiuw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uuXnx-0000iY-BS
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 05 Sep 2025 14:52:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1uuXnv-0000iS-I2
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 Sep 2025 14:52:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lNJmb91huSLN3d6QUPI4dIIOu1cH9V8bQvyuIahQuKM=; b=Oq3+0J9sxIm7xg+Ot35UspoNWF
 xCbylvF6WFzk8sK2t9Dwlq+6HSSiYaY9t6fCiNM+2qRdygMU0aSWmsGYUzMPY1WoNdDnKxpogaY1p
 TayRW9gAyWlhjXIj9Kxz78fqtongQ0btlhEcpc372WT8+mH9QuhZFnXRi+/3jyP21cks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lNJmb91huSLN3d6QUPI4dIIOu1cH9V8bQvyuIahQuKM=; b=PiXIEtdyH17dA6v7eSTPUNB+go
 vZtRIP2VaKJNKjzQ/mULOoHjUIM86fN09jHHyqZ1QwyhfsQQEYvVoPFRCV3psZJqHi8wzvQrCFtYI
 xGxbJy0rTOMr4vOjDBUaIcG+Hrs9oWqUewdBzj9RUcUFSvVlKOEcSfECoVbAKBq6EdJc=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uuXnv-0005cV-0L for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 Sep 2025 14:52:43 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1757083955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lNJmb91huSLN3d6QUPI4dIIOu1cH9V8bQvyuIahQuKM=;
 b=TasVQrrv0+VlZT7ShLM+x0HY0QYw0AzbdY4hEUlNFvqMkJ2DelOt/p5WCtxnibKETKtXjI
 Hq1jww8/I1jWryPdmNFQbelOpqlhbtDIHsXQ37ZDmT63MJYIYnjeVkLuV5a6QuoI2v2Eqz
 TzbTnG5rpdhW9/2siEXyMc52a0LJ3SApgzAW1leN5YiomMcqemj5rZjER8QhVXvOxdrEpz
 SRJo2y9f7MYMEbmQv23rOESNbzyKBmtH138wvdzUaHzuPBzVwdadACn4PVCumHhZsNE0fy
 qRAoafq1TEluO6VSenSpmSXSrrPCmDR6XQfJTBr31oGRlzz8J4GYxGclBgHETw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1757083955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lNJmb91huSLN3d6QUPI4dIIOu1cH9V8bQvyuIahQuKM=;
 b=4CBkmSoPp06N8LzJjJEf95pQRhzVmonT+5akiifYx8zGCiKpnKndOvM0jqGJ6kC4a47vAy
 3J75zBxonjp4t1DA==
To: Marcos Paulo de Souza <mpdesouza@suse.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>
In-Reply-To: <20250902-nbcon-kgdboc-v3-3-cd30a8106f1c@suse.com>
References: <20250902-nbcon-kgdboc-v3-0-cd30a8106f1c@suse.com>
 <20250902-nbcon-kgdboc-v3-3-cd30a8106f1c@suse.com>
Date: Fri, 05 Sep 2025 16:58:34 +0206
Message-ID: <84y0qtdk99.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-09-02, Marcos Paulo de Souza <mpdesouza@suse.com>
 wrote: > diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c > index
 ff218e95a505fd10521c2c4dfb00ad5ec5773953..352235a0eb4a484caccf86d3 [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
X-Headers-End: 1uuXnv-0005cV-0L
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/4] printk: nbcon: Allow KDB to
 acquire the NBCON context
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

On 2025-09-02, Marcos Paulo de Souza <mpdesouza@suse.com> wrote:
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index ff218e95a505fd10521c2c4dfb00ad5ec5773953..352235a0eb4a484caccf86d3a57d1a149218ecec 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -255,6 +258,7 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
>  		 * interrupted by the panic CPU while printing.
>  		 */
>  		if (other_cpu_in_panic() &&
> +		    READ_ONCE(kdb_printf_cpu) != raw_smp_processor_id() &&

This needs some sort of ifdef CONFIG_KGDB_KDB wrapped around it. Maybe
it would be cleaner to have some macro.

#ifdef CONFIG_KGDB_KDB
#define KGDB_IS_ACTIVE() (READ_ONCE(kdb_printf_cpu) == raw_smp_processor_id())
#else
#define KGDB_IS_ACTIVE() false
#endif

and then something like:

	if (other_cpu_in_panic() &&
	    !KGDB_IS_ACTIVE() &&
	    (!is_reacquire || cur->unsafe_takeover)) {
		return -EPERM;
	}

Or however you prefer. We need to compile for !CONFIG_KGDB_KDB.

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
