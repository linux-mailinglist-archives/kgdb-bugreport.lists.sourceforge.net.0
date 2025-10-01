Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF053BB0F4C
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 01 Oct 2025 17:09:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9yYFGrAq1iJb6PhqIjFCk5f6TLZbgRs0+aeVBP/Nw4=; b=ZblBmftjw4AqLEdPn6tCLxXCMN
	vtln/oyeRDfHlHeml6nWNYkHaE7SWHorHtmJHruM2Ym3i/HsM2rGQDM3X17Tya8djcEoopRz+yrk0
	PF+hq5K7VeQQ01Fhx+mpgIeShbH3KppTVzbQ7Fy8s3qsGRE2SiKu+z3JBbqIABhPBOic=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1v3yS6-0004so-Pm
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 01 Oct 2025 15:09:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1v3yS5-0004sh-CN
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 01 Oct 2025 15:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fguV5cbsHKuUFApAwnvZw5d5Ai6OoR9oWuiwl4vfpSM=; b=Ycl7OvbBty3nyD2hRImSQUv1iU
 Gq3B5zDyWkmDnJREV552Kay4nFwb09fJ1dunIeOWDiYzP8p58hKpYNYSgIp9I6N3oltHTSOHyCrCY
 RUHNzpZM8fpIAs7jPmPZfej5rhbUWmqmovJ4n2CxehwWcHey+XLUpemwkfj7Etpf0+PA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fguV5cbsHKuUFApAwnvZw5d5Ai6OoR9oWuiwl4vfpSM=; b=eB0yIuoPuwqDKXsEOCWaBEy9kK
 OyiKHoPeEPwH2O7lZk/iwvIxdG/LRv9Kxt+kF/RcYbk5Sf8yW+Byt30eLePQoWbnxcyJ5U7NEVrJe
 ft9mmT5GEhnP+FdBb9jo1SwFAth3ngssfyqpmeJMYc/eFIzRHCj8I/Q6VhDEqviBrsyQ=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3yS4-0005U2-TL for kgdb-bugreport@lists.sourceforge.net;
 Wed, 01 Oct 2025 15:09:09 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1759331337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fguV5cbsHKuUFApAwnvZw5d5Ai6OoR9oWuiwl4vfpSM=;
 b=mPczA7C5nO//5gBKxPj1IEDbHuF7u0K6htFM12e0aCufPawyBemSSoaY5U5nJYODzMf5ri
 3pebGEM8NyK1AAeQIZ3djORNgGcsMrNih7FJetrPt+NQ8RIDZEPS95TPS8laUeoRq9rv8R
 ncBxU6ku90iLFOop2LnFGP22NZKSqXEqBza0NAXcwskpVEVKWZsYc8L31Xjn9RuGOIq6/D
 vvj13BlecZ4/cyN8o0NgvTkTPStUImNt7E0XUNVXOwQtaIjRcVH21rgw8l11o0SX8FBD+0
 9DvOvgQTiZApi/UiaVMWhSO0gk0lJZOHazzO66HYcmHb22Wj9YZPjlTfdGhxWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1759331337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fguV5cbsHKuUFApAwnvZw5d5Ai6OoR9oWuiwl4vfpSM=;
 b=I4KgKjhehQ1b3il3f4YFTcfw3/+mUM9oRJLE8/F71S55E9uzBqoRu6kuli6Qlx6i3E3isx
 JhW1F5lAJGdQlICg==
To: Marcos Paulo de Souza <mpdesouza@suse.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>
In-Reply-To: <20250930-nbcon-kgdboc-v5-4-8125893cfb4f@suse.com>
References: <20250930-nbcon-kgdboc-v5-0-8125893cfb4f@suse.com>
 <20250930-nbcon-kgdboc-v5-4-8125893cfb4f@suse.com>
Date: Wed, 01 Oct 2025 17:14:56 +0206
Message-ID: <84bjmqhd6f.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-09-30, Marcos Paulo de Souza <mpdesouza@suse.com>
 wrote: > diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c > index
 6e4641350fe8985438f53bcd32f3adf72d9d6835..2492b14bd272562378c4cdb4 [...] 
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
X-Headers-End: 1v3yS4-0005U2-TL
Subject: Re: [Kgdb-bugreport] [PATCH v5 4/5] printk: nbcon: Export
 nbcon_write_context_set_buf
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
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 6e4641350fe8985438f53bcd32f3adf72d9d6835..2492b14bd272562378c4cdb465eea2269638e127 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -854,7 +854,7 @@ static bool __nbcon_context_update_unsafe(struct nbcon_context *ctxt, bool unsaf
>  	return nbcon_context_can_proceed(ctxt, &cur);
>  }
>  
> -static void nbcon_write_context_set_buf(struct nbcon_write_context *wctxt,
> +void nbcon_write_context_set_buf(struct nbcon_write_context *wctxt,
>  					char *buf, unsigned int len)

Could we also update the whitespace on the 2nd line? And it would all
fit on one line if you want.

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
