Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2940AD91BC
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 13 Jun 2025 17:43:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xauah9ODtbN8rDRLOlYX+HW2WyEfvzdv2CJqndGj5ls=; b=Qg6PRVCBc6celemxLt5ja60WME
	HPco4qjJ7yx983E7qSq/C1NWsx8IXU0T5aJHUZRLlEOAakC2/Ilj3e6Dzusf+4KQWepU77EBlsxPy
	8xFqdby0MrS5NGUYPoWNLRKBmcMzoJfS5A1IxeOYLdEGQAjamSmf0PN6aUM32DKxJqpo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uQ6ZP-0006Hp-G6
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 13 Jun 2025 15:43:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uQ6ZN-0006Hi-EO
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Jun 2025 15:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IKghZF40bURJv6c1/M9CEvL/tJPBCTMeZ3wBhbe2yAU=; b=TAmR7DXOKnJ+Bva1rpRdRIKmEo
 +WokFLT0gHy7NMIbOnJey0OFTEVz8knH1yPPKIf5AogZEbr0luGuGflDTgkWJcXg3bklkEcZAhT1N
 6b/MdrNoEK2MoTFw6bCskQ1YaVci7Cdz28nM4xxpgEaEXA9Qzc2Zy01jUY6bXTZ2MIC8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IKghZF40bURJv6c1/M9CEvL/tJPBCTMeZ3wBhbe2yAU=; b=AtwFEWj6URC7geSuy0JJOrF2aT
 oMMjS+dIQ63k6R07cjqZ6n/H1FI74bl2lhBcNuixia1d0GIy0qc2E7Vp/wkaSzK1uQNuecpwM8jUr
 xdynEi5UoMyap9E+Bo41zhWZvgXFL4b/rZvxM4rKaWLZevXDv3+72HApH+iPZiNDg9qo=;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uQ6ZM-0008KX-R2 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Jun 2025 15:43:53 +0000
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a361b8a664so2166066f8f.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 13 Jun 2025 08:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1749829426; x=1750434226; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IKghZF40bURJv6c1/M9CEvL/tJPBCTMeZ3wBhbe2yAU=;
 b=CNXrVU6ZZcLKK7CI6OV0IdjENCsHnjeR0hZ8YG/+KsP0Swq5z1ZDzzzPI6GMbFfXyS
 lv3vTA6aQ7x6WezfSntnHcGRBqlwiOt4gbv4lTc5Vl9QLhFj2D8DqjdPmgrdPprzF/Uf
 smqqH6NfqB1oeMNVQm1bXNNUFKTGNhsPjF4oAxNG+H7q41uS3dBP4K7I1nghlbmgFBMw
 6sQ8yHR7AEuOIvI1/7WO4C8Qyau8I13l1SykrNXniG9aRey/R8pwWm3DYx2xDi5VBu82
 VF3Ggjpghpeffg/8OL3Y43kDZWMxWbLwORdT3ppdxO+fmbf2vA2RsxpZw3xsc1BwYa1Y
 JfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749829426; x=1750434226;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IKghZF40bURJv6c1/M9CEvL/tJPBCTMeZ3wBhbe2yAU=;
 b=uczRFphl3x463CIEvuXaJqiCSd/9heq0lovPXlrFCRCdH7FfsxESHx5/iadbHMtQHI
 J0LCFLmuK6ITPXXsqodWLpFHcfz8NStQYbA2LhPhMjrvxoMPHn+JgHqpr4I2OxZTyN27
 jTW+rfNPsKA53/dnLkBoRaWM0J+xiJOmGNOipxJuI16Q1JGiR1hwCnyGqVBgJJpWXaLR
 U39SI/1mFk0SiWt3qmJrwTfmWXlKZehc2LYOthQuYM+JlkLvJT/J2Yio1o0F5lQnY6+I
 uNEocQfRMRBM3FC+Mq4zCL0nCWAbOMSdC5Fz5LBJhUgvbR8AHoPZe15KH8G6czCECzNZ
 kYzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWktCVQkfw98GJhOiav5t5euWPDIcZfJYi4GfLiUU98NywjDtxrAnBNJnsC4JYQOcl50LxGcNpzD2cg3LU+7A==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy/YrwiWN7CPuAuYO7ffT4eyzuNv9cA2DdpaA5shdpb/UL96Br7
 pjg7MsKh+oOK5MSoKy2WprFoDmpocylVQHzGI7kUI88Dk7ffyfJivtT+xKkU/8/vfDYBfyGM89Y
 o0D35
X-Gm-Gg: ASbGncv3K3Xzuy6Den0QguC65FN6QZZ6L0tntRMMjU2thiWUQ8wtjA4dx21FFR0kjCI
 6dYzdPWnxoRvKcSTz15x5gy81Zmtms1omhPj02H9ok2pfO3VnrAZ4OameK15zk3f/y3eDmScqWM
 o7fPlcGM8qtLFKG4vFTYtsh6H+sD10NwYlupgzXNuxLNPBqc5tTr83+VsndVFGVZfFbqIT703RY
 BgysAlM3EvaloLDorkDrq9rjLeBMamhEFV7/TPzW8eTxEdCaER7S7BPURM8y7cG3yvTFXfX7O/L
 e864b71f82BE6t9xgpyElruZNnTul49q82PZL+ng5qWMxRdgj2Vx/iFcbIMbp5jQ
X-Google-Smtp-Source: AGHT+IG0wPBdTWS6wVof0adSsVA4MK43CPoXzZFMCGpr9V6ukNZIjbxKLrOISAjwEQzvtDU5jyZr4A==
X-Received: by 2002:a05:6000:25eb:b0:3a3:65b5:51d7 with SMTP id
 ffacd0b85a97d-3a572e2df7bmr142313f8f.26.1749828025451; 
 Fri, 13 Jun 2025 08:20:25 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe1691d7fsm1835856a12.69.2025.06.13.08.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 08:20:24 -0700 (PDT)
Date: Fri, 13 Jun 2025 17:20:03 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aExBo-8cVOy6GegR@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-2-f427c743dda0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250606-printk-cleanup-part2-v1-2-f427c743dda0@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-06-06 23:53:44, Marcos Paulo de Souza wrote: >
 Instead of update a per-console CON_SUSPENDED flag, use the console_list
 > locks to protect this flag. This is also applied to console_is_usa [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.46 listed in wl.mailspike.net]
X-Headers-End: 1uQ6ZM-0008KX-R2
Subject: Re: [Kgdb-bugreport] [PATCH 2/7] printk: Use consoles_suspended
 flag when suspending/resuming all consoles
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
Cc: Richard Weinberger <richard@nod.at>,
 John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Johannes Berg <johannes@sipsolutions.net>, Jiri Slaby <jirislaby@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2025-06-06 23:53:44, Marcos Paulo de Souza wrote:
> Instead of update a per-console CON_SUSPENDED flag, use the console_list
> locks to protect this flag. This is also applied to console_is_usable
> functions, which now also checks if consoles_suspend is set.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  kernel/printk/internal.h |  7 ++++++-
>  kernel/printk/nbcon.c    |  8 ++++----
>  kernel/printk/printk.c   | 23 ++++++++++-------------
>  3 files changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/kernel/printk/internal.h b/kernel/printk/internal.h
> index 48a24e7b309db20fdd7419f7aeda68ea7c79fd80..752101904f44b13059b6a922519d88e24c9f32c0 100644
> --- a/kernel/printk/internal.h
> +++ b/kernel/printk/internal.h
> @@ -118,8 +118,12 @@ void nbcon_kthreads_wake(void);
>   * which can also play a role in deciding if @con can be used to print
>   * records.
>   */
> -static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
> +static inline bool console_is_usable(struct console *con, short flags,
> +				     bool use_atomic, bool consoles_suspended)
>  {
> +	if (consoles_suspended)
> +		return false;
> +
>  	if (!(flags & CON_ENABLED))
>  		return false;
>  
> @@ -212,6 +216,7 @@ extern bool have_boot_console;
>  extern bool have_nbcon_console;
>  extern bool have_legacy_console;
>  extern bool legacy_allow_panic_sync;
> +extern bool consoles_suspended;
>  
>  /**
>   * struct console_flush_type - Define available console flush methods
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index fd12efcc4aeda8883773d9807bc215f6e5cdf71a..72de12396e6f1bc5234acfdf6dcc393acf88d216 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1147,7 +1147,7 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
>  	cookie = console_srcu_read_lock();
>  
>  	flags = console_srcu_read_flags(con);
> -	if (console_is_usable(con, flags, false)) {
> +	if (console_is_usable(con, flags, false, consoles_suspended)) {

The new global console_suspended value has the be synchronized the
same way as the current CON_SUSPENDED per-console flag.
It means that the value must be:

  + updated only under console_list_lock together with
    synchronize_rcu().

  + read using READ_ONCE() under console_srcu_read_lock()


I am going to propose more solutions because no one is obviously
the best one.

Variant A:
=========

Create a helper functions, similar to
console_srcu_read_flags() and console_srcu_write_flags():

Something like:

static inline bool console_srcu_read_consoles_suspended()
{
	WARN_ON_ONCE(!console_srcu_read_lock_is_held());

	/*
	 * The READ_ONCE() matches the WRITE_ONCE() when the value
	 * is modified console_srcu_write_consoles_suspended().
	 */
	return data_race(READ_ONCE(consoles_suspended));
}

static inline void console_srcu_write_consoles_suspended(bool suspended)
{
	lockdep_assert_console_list_lock_held();

	/* This matches the READ_ONCE() in console_srcu_read_consoles_suspended(). */
	WRITE_ONCE(consoles_suspended, suspended);
}

This has the drawback that most console_is_usable() callers would need
to get and pass both variables, for example:

--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1137,6 +1137,7 @@ static bool nbcon_emit_one(struct nbcon_write_context *wctxt, bool use_atomic)
  */
 static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_context *ctxt)
 {
+	bool cons_suspended;
 	bool ret = false;
 	short flags;
 	int cookie;
@@ -1147,7 +1148,8 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
 	cookie = console_srcu_read_lock();
 
 	flags = console_srcu_read_flags(con);
-	if (console_is_usable(con, flags, false)) {
+	cons_suspended = console_srcu_read_consoles_suspended();
+	if (console_is_usable(con, flags, false, cons_suspended)) {
 		/* Bring the sequence in @ctxt up to date */
 		ctxt->seq = nbcon_seq_read(con);

Pros:

   + always correct

Cons:

   + not user friendly



Variant B:
==========

Do not pass @consoles_suspended as a parameter. Instead, read it
in console_us_usable() directly.

I do not like this because it is not consistent with the con->flags
handling and it is not clear why.


Variant C:
==========

Remove even @flags parameter from console_is_usable() and read both
values there directly.

Many callers read @flags only because they call console_is_usable().
The change would simplify the code.

But there are few exceptions:

  1. __nbcon_atomic_flush_pending(), console_flush_all(),
     and legacy_kthread_should_wakeup() pass @flags to
     console_is_usable() and also check CON_NBCON flag.

     But CON_NBCON flag is special. It is statically initialized
     and never set/cleared at runtime. It can be checked without
     READ_ONCE(). Well, we still might want to be sure that
     the struct console can't disappear.

     IMHO, this can be solved by a helper function:

	/**
	 * console_srcu_is_nbcon - Locklessly check whether the console is nbcon
	 * @con:	struct console pointer of console to check
	 *
	 * Requires console_srcu_read_lock to be held, which implies that @con might
	 * be a registered console. The purpose of holding console_srcu_read_lock is
	 * to guarantee that no exit/cleanup routines will run if the console
	 * is currently undergoing unregistration.
	 *
	 * If the caller is holding the console_list_lock or it is _certain_ that
	 * @con is not and will not become registered, the caller may read
	 * @con->flags directly instead.
	 *
	 * Context: Any context.
	 * Return: True when CON_NBCON flag is set.
	 */
	static inline bool console_is_nbcon(const struct console *con)
	{
		WARN_ON_ONCE(!console_srcu_read_lock_is_held());

		/*
		 * The CON_NBCON flag is statically initialized and is never
		 * set or cleared at runtime.
		return data_race(con->flags & CON_NBCON);
	}


   2. Another exception is __pr_flush() where console_is_usable() is
      called twice with @use_atomic set "true" and "false".

      We would want to read "con->flags" only once here. A solution
      would be to add a parameter to check both con->write_atomic
      and con->write_thread in a single call.

      But it might actually be enough to check is with the "false"
      value because "con->write_thread()" is mandatory for nbcon
      consoles. And legacy consoles do not distinguish atomic mode.


Variant D:
==========

We need to distinguish the global and per-console "suspended" flag
because they might be nested. But we could use a separate flag
for the global setting.

I mean that:

    + console_suspend() would set CON_SUSPENDED flag
    + console_suspend_all() would set CON_SUSPENDED_ALL flag

They both will be in con->flags.

Pros:

    + It is easy to implement.

Cons:

    + It feels a bit ugly.


My opinion:
===========

I personally prefer the variant C because:

  + Removes one parameter from console_is_usable().

  + The lockless synchronization of both global and per-console
    flags is hidden in console_is_usable().

  + The global console_suspended flag will be stored in global
    variable (in compare with variant D).

What do you think, please?

Best Regards,
Petr


PS: The commit message and the cover letter should better explain
    the background of this change.

    It would be great if the cover letter described the bigger
    picture, especially the history of the console_suspended,
    CON_SUSPENDED, and CON_ENABLED flags. It might use info
    from
    https://lore.kernel.org/lkml/ZyoNZfLT6tlVAWjO@pathway.suse.cz/
    and maybe even this link.

    Also this commit message should mention that it partly reverts
    the commit 9e70a5e109a4a233678 ("printk: Add per-console
    suspended state"). But it is not simple revert because
    we need to preserve the synchronization using
    the console_list_lock for writing and SRCU for reading.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
