Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EACDBE85CB
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 17 Oct 2025 13:34:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyXubOTVHAnB3IhfdNUcGFGMteaJH6A9q1cpf9syAYk=; b=SCWgQ9Q1tuZtRG/RNUWY5HPx//
	Mb+LR9iuFmwpgCE1LC5CWRrBvz4ijwXf2rx1LOSH47CQn2pNVSYie16hROoUVetpeC7DZ+1Xl085O
	0E/IxfYDftgooZAm/DMZNlPvZw4ursMczdTg/Ek7oC6+aHNgo6SXX0gahVLsyZZtHzSw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1v9iiy-0002Hl-41
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 17 Oct 2025 11:34:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1v9iix-0002Hc-05
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Oct 2025 11:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SvkRtEfFY44KSkmHTWo/OqVypeDVfWVsWktvMnmmBeo=; b=mqPOE/x1K0FSWfxpZfvG8jq0Zn
 +x3BGN2l2YKX7YolJwT/eguZers9MhBH+J4Zk8AnwpBdj+MaX6bh+OOurwrrzvbFbyUx5YqukQuEp
 aDSJczrKDZcZuR1Vjz9lWHPJTfT2D4jqGrP+Uf2E4zWgP0zRrWDhjVca7lYYNGYFpx4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SvkRtEfFY44KSkmHTWo/OqVypeDVfWVsWktvMnmmBeo=; b=cpZdIMXQjEZhsa9w+DyKDE2J/z
 BXwX4h18MCkMZVUR5HjeftrOaqWfq9UcEJ8Z978Q4GXeUIewvYSN063o4C4ekMmcP/GkYpBZOYXAC
 w9ULbC8Wge8C8/ea4mWc/bijS+4Klfhmqmpo0Wc8f316nnWjs8Gn/m4MV8j00Bw4zr+A=;
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v9iiv-0003L1-Pe for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Oct 2025 11:34:18 +0000
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-427091cd4fdso200275f8f.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 17 Oct 2025 04:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1760700846; x=1761305646; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SvkRtEfFY44KSkmHTWo/OqVypeDVfWVsWktvMnmmBeo=;
 b=cfOblt0gpYdSius2cDlJp2xQr0g86wf0VSJym7Jh+h5Fttk8EqRcyFxSne73xm/n0L
 D5zR+FufPz/68feDC+xkhLQtkI5utI1+mSwPNIlquf4bEAHoXYYa4uNXwdZS40r+b8er
 0O1yK+IZ22aKHpdGjADRNokvZiY60HlIUDvDM05v4goqDN9HX65lngX5Q2BMhgxaJeZG
 yeCCDv1WoqXiQHnUddR1K2uK1FF2LoAU5KCB5PFvSfBVS8f/WqwvyAPQOee3yTlNUUUR
 XYkFoTrrQ+dPt9p/W7wLLGGOMB/9eRaFFCDzD9/UuY2sOgE1xr6kbFpMvPIAkCHuXgAW
 QE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760700846; x=1761305646;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SvkRtEfFY44KSkmHTWo/OqVypeDVfWVsWktvMnmmBeo=;
 b=DgJjlvEWpXrY4nGzuVqbdBNt88QJYoQfMyYzcQVXmk9XEtMAnz1MlvLM+Axt5xixxm
 wgCdB3rb8mJ65Cz0t4gmZEcq0HEjrhFAZsi1SO3nzaGBV393vaWMQB6kxUm+3GXAD5oG
 p88fhY6aezBW1qkw7zyF3On4hQ3FPwLjtZ1TyxpZ7BN/+3XRXhZpuAbrdXe7IbLIVW3/
 CH4yEaMRqRVzBpezBy7Mr/1fMFnNfrsnGvBXpeLxryr5AL0QtTcSlh56EQr5B9A0KYpx
 vxv+ZTEqWNXNI/8eJZ8K7hi82JAov7SWo6+njFNvnzB+0oOxRgh3gQXdF+7G11Igxhto
 Bivw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpS+aVx2bYhgmcunbnPaiUvlZU3XyqjAjJEjZoVWsyTyQJb64H1j/5FAZAi9p2B9aFide8eNaKxEnEvX4NQA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx76JreU+hyohJbpJDgC0tMnK8Bu7y/Q1sAOd6n9vcnIJye+liD
 9lLD5JipZ08WA3d7EtIDcjA6y3CkWS8+E2tMfd7i9lfRg7YBTDrnyXNRK5zF3KpElijfQFLAhsr
 9XDkQ
X-Gm-Gg: ASbGncuB08a/eAdSmRhkhy5j0JlvH1pNIeVoi/DV4sB3d+kq17yuo+lzzkHkV3edZgZ
 0icr6ib6u/XaYop2ki0cyrqnl1MYE2uQmO+sd8DhMu3+gxz00zD4eDD/r4EP9qEdnPHZeTATV0e
 +pmClg4dudxcOpzhuiHCoyCldvSiFJDbyx43T6PueY+QK3npF9D1xeY2cPzrW8jWUJ9f5jyvE9i
 thb2ZqERJ6+CIoUomN0hxA9jQpzHK4b0s9zD+TG+LSwcrR82N3/fZUaU1hzjQFGaF6p2NvyIziJ
 qooQ5Hnry99YwiAOcVi7c5RqReQRqyOlogKP+0M3OJ0krfVZUxKqq/TVOzljpCfbXkDDqtODM10
 yeRTYKwd2tjzeWpQAMF9MZGFf7eflvYjpA70HQ47o35WSRgQfvhnEOuPzoWBdtJh8ip5b+cOJ28
 S3ZKY=
X-Google-Smtp-Source: AGHT+IG+UnEp2b7Yue1jCZ/70/3WE2TI5L6wdx4OGrQSOn0VeOaD8ulTrB8zeTdZAWnnw8KF5KoYOA==
X-Received: by 2002:a05:6000:2307:b0:425:8125:b108 with SMTP id
 ffacd0b85a97d-42704dab10dmr2158926f8f.54.1760700846044; 
 Fri, 17 Oct 2025 04:34:06 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42704141cdfsm7138939f8f.4.2025.10.17.04.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 04:34:05 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:34:03 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aPIpq17rUbNbLEWT@pathway.suse.cz>
References: <20251016-nbcon-kgdboc-v6-0-866aac60a80e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016-nbcon-kgdboc-v6-0-866aac60a80e@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 2025-10-16 11:47:53, Marcos Paulo de Souza wrote: >
 In v6 the patches were rebased on top of v6.18-rc1, added Reviewed-by tags
 from > John and did some small changes suggested by him as well. > [...] 
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.43 listed in wl.mailspike.net]
X-Headers-End: 1v9iiv-0003L1-Pe
Subject: Re: [Kgdb-bugreport] [PATCH v6 0/5] Handle NBCON consoles on KDB
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu 2025-10-16 11:47:53, Marcos Paulo de Souza wrote:
> In v6 the patches were rebased on top of v6.18-rc1, added Reviewed-by tags from
> John and did some small changes suggested by him as well.
> 
> As usual, how I tested the changes:
> 
> Testing
> -------
> 
> I did the tests using qemu and reapplying commit f79b163c4231
> ('Revert "serial: 8250: Switch to nbcon console"') created originally by
> John, just to exercise the common 8250 serial from qemu. The commit can
> be checked on [1]. I had to solve some conflicts since the code has been
> reworked after the commit was reverted.
> 
> Then I would create three different serial entries on qemu:
> -serial mon:stdio -serial pty -serial pty
> 
> And for the kernel command line I added:
> earlyprintk=serial,ttyS2 console=ttyS2 console=ttyS1 console=ttyS1 kgdboc=ttyS1,115200
> 
> Without the last patch on this patchset, when KDB is triggered, the mirroring
> only worked on the earlyprintk console, since it's using the legacy console.
> 
> With the last patch applied, KDB mirroring works on legacy and nbcon
> console. For debugging I added some messages to be printed by KDB, showing
> also the console->name and console->index, and I was able to see both
> ->write and ->write_atomic being called, and it all working together.
> 
> [1]: https://github.com/marcosps/linux/commit/618bd49f8533db85d9c322f9ad1cb0da22aca9ee
> [2]: https://lore.kernel.org/lkml/20250825022947.1596226-1-wangjinchao600@gmail.com/
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
> Changes in v6:
> - Rebased on top opf v6.18-rc1
> - Changed some includes, as suggedted by John
> - Reworked comments as suggested by John
> 
> Changes in v5:
> - Added review tags from Petr
> - Changes the way we detect if a CPU is running KDB.
> - Link to v4: https://lore.kernel.org/r/20250915-nbcon-kgdboc-v4-0-e2b6753bb566@suse.com
> 
> Changes in v4:
> - Added ifdefs to only check for KGDB if KGDB was enabled, suggested by John Ogness
> - Updated comments about KDB on acquire_direct, suggested by Petr and John
> - Added a new patch to export nbcon_write_context_set_buf, suggested by Petr and John
> - Link to v3: https://lore.kernel.org/r/20250902-nbcon-kgdboc-v3-0-cd30a8106f1c@suse.com
> 
> Changes in v3:
> - Only call nbcon_context_release if nbcon_context_exit_unsafe returns true (John Ogness)
> - Dropped the prototype of console_is_usable from kernel/printk/internal. (Petr Mladek)
> - Add comments to the new functions introduced (Petr Mladek)
> - Flush KDB console on nbcon_kdb_release (Petr Mladek)
> - Add an exception for KDB on nbcon_context_try_acquire_direct (John Ogness and Petr Mladek)
> - Link to v2: https://lore.kernel.org/r/20250811-nbcon-kgdboc-v2-0-c7c72bcdeaf6@suse.com
> 
> Changes in v2:
> - Set by mistake ..
> - Link to v1: https://lore.kernel.org/r/20250713-nbcon-kgdboc-v1-0-51eccd9247a8@suse.com
> 
> ---
> Marcos Paulo de Souza (5):
>       printk: nbcon: Export console_is_usable
>       printk: nbcon: Introduce KDB helpers
>       printk: nbcon: Allow KDB to acquire the NBCON context
>       printk: nbcon: Export nbcon_write_context_set_buf
>       kdb: Adapt kdb_msg_write to work with NBCON consoles
> 
>  include/linux/console.h   | 55 ++++++++++++++++++++++++++++++++++++
>  include/linux/kdb.h       | 16 +++++++++++
>  kernel/debug/kdb/kdb_io.c | 47 +++++++++++++++++++++----------
>  kernel/printk/internal.h  | 45 ------------------------------
>  kernel/printk/nbcon.c     | 71 +++++++++++++++++++++++++++++++++++++++++++++--
>  5 files changed, 171 insertions(+), 63 deletions(-)

With the two below compilation fixes, the series seems to be ready for
linux-next.

I am going to wait with pushing a week or so to give other printk and
kdb maintainers and reviewers a chance to look at it.

The following two changes are needed to fix build with
CONFIG_PRINTK and/or CONFIG_KGDB_KDB disabled. I am going
to do the in the respective patches when committing:

diff --git a/include/linux/console.h b/include/linux/console.h
index 81d2c247c01f..690a5f698a5c 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -664,7 +664,7 @@ static inline bool nbcon_exit_unsafe(struct nbcon_write_context *wctxt) { return
 static inline void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt) { }
 static inline bool nbcon_kdb_try_acquire(struct console *con,
 					 struct nbcon_write_context *wctxt) { return false; }
-static inline void nbcon_kdb_release(struct console *con) { }
+static inline void nbcon_kdb_release(struct nbcon_write_context *wctxt) { }
 static inline bool console_is_usable(struct console *con, short flags,
 				     bool use_atomic) { return false; }
 #endif
diff --git a/include/linux/kdb.h b/include/linux/kdb.h
index db9d73b12a1a..741c58e86431 100644
--- a/include/linux/kdb.h
+++ b/include/linux/kdb.h
@@ -226,7 +226,7 @@ static inline void kdb_init(int level) {}
 static inline int kdb_register(kdbtab_t *cmd) { return 0; }
 static inline void kdb_unregister(kdbtab_t *cmd) {}
 
-static inline bool kdb_printf_on_this_cpu(void) { return false };
+static inline bool kdb_printf_on_this_cpu(void) { return false; }
 
 #endif	/* CONFIG_KGDB_KDB */
 enum {


Best Regards,
Petr




> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20250713-nbcon-kgdboc-efcfc37fde46
> 
> Best regards,
> --  
> Marcos Paulo de Souza <mpdesouza@suse.com>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
