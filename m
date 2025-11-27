Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A8FC8DA2E
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 27 Nov 2025 10:49:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odKBz7xZH7Job/Iq4ed/13jw2KhzihJyu9t1ms/aUog=; b=U52kXuEWzZdItR6WaCbRAx9DYs
	47sHbbQEZH5f/WCEyabL3KHTFb6bP5a0zdKRQZs5M7VpuiDsD6uEGm2otb6BSJWMotMwKNOmoFvyR
	y0Tvu1AF2lvizN2kNj9xs1+FeYim3tsKvTgceTHPWsD2XxAlWvN11Wm4xDbLQWAU25Mg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vOYdF-0003lV-N9
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 27 Nov 2025 09:49:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vOYdE-0003lN-B1
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 27 Nov 2025 09:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M55NOPX6+5YD0B0HIxdp5eD8kEu/VA3rAyDyjjhFwp8=; b=Ka7z6EesxHSTNmg+f54aCTin5I
 AOZDG0an4mvTYIA3xgApmRNr2M3W7gUVYYMWYihl9RYhkxib5qJGmVG9X+pkHPib4XjD1YK4/aeDv
 xEYdk58Rm+WkVlcm6mFlQFQPpzfO9TDcm0pQFnTclLLh3Ei7d3GeHxD4m9F4f0xbB6B4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M55NOPX6+5YD0B0HIxdp5eD8kEu/VA3rAyDyjjhFwp8=; b=Y4cBmU6AtsYQGoasOeqewOTPud
 in+OsRsRU0meWwf+CKlypx+CMDYDIozNTjBHPoDA7iuh/G7i3cl5nvYuH30nYZ8gpIAU4doK0cotI
 h5lvLvxo7e4z5VICiWei19qOJI5yeIXeY6/78Xiy2ARatkULhdtbQspjX0GFvhZW6b8w=;
Received: from mail-ej1-f50.google.com ([209.85.218.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vOYdD-0000FR-Bw for kgdb-bugreport@lists.sourceforge.net;
 Thu, 27 Nov 2025 09:49:44 +0000
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b713c7096f9so106506466b.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 27 Nov 2025 01:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1764236972; x=1764841772; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M55NOPX6+5YD0B0HIxdp5eD8kEu/VA3rAyDyjjhFwp8=;
 b=B3DWvxmbBRSUcAZL6N/DgaXJyTUsG8DBa0J3oWQpxKzeZdyp3bqhPdEQqbVkYS5po6
 lqSNZ6gBV0C/livL5SLB9eBa6RcgMekC/180mFatMGRPdwRvwRkReCpV1qe3MHITFmJO
 KP+u+v1TaSVhIl9TOEyY9flNpEd3Pj88o0VpgfSSLoT0+R28WSm+n6ypTo/sv9JIx+Bk
 d7YFTnpebMfr8UDLBzahttn/zRocNDEVeDT1IhRHRvgLv8GJ5jt5Qw62sKfsF2WFwgak
 JOU3jLk6gVvZrrGfhkqWPho9PCSO4ifhe/UQgfXxtzy9eRXKQjHM+ZS4jvezcJzVICIW
 vEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764236972; x=1764841772;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M55NOPX6+5YD0B0HIxdp5eD8kEu/VA3rAyDyjjhFwp8=;
 b=B08hh3kmR7uu/nmcLa4OoP7TT52QR6OZF5JWFXjM3cIT6vp8JF8eAfSqBc7gSkO4cf
 dTz1uPKjBk9NjVFTnZKIF37xUJWdJTEP/06KP9BNs4Pqe6k2/XgxMI7SOYb7aBydMsCh
 37WC+yJAGFJwExuWbJUJsUrJxVa83Njsrb8t97P4tcwaGzDACRoDwE10nPvj5g0EomPk
 fUYu/Z68wz7HwRhKnqBjZckwfaEVpj1Fk3Uyb0ZQ7iuhRiIiYzL7T671L37ShEyBUy7e
 Mt3izlnIgDTflNszavdyuNs/vUDnO1c7fMqyV68VLQfSVcDAY9U7nn16CQ7UCPPu2N9i
 3l/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVsMdF8VmK9YLoVKL8/PlSuQGOgxL6upNSkzkZ7vUvFNof1dLXB41D+J9z2mVsghJq/inhi0oGvi6zEcZrqg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwceduJZtYG6mt3glivG5Bbpu+DE4AZq9+BV2sxtXhUmtSwwQLE
 BagkY1Niqb3n8mR+txWPrJJYQ11KUBlG+LXDqLDYkGK1k4seq1FcvM4IuIZJp72K6HM=
X-Gm-Gg: ASbGnctaAItHpzGy7TA+7TaPIKxkdb4J9BQ0on6Ahwl9NVhWiJhuCUl11c20hhiczHN
 sCO0eA98i5pZ3IndWjZ8Z22uFpJ18xn/E4doaV/0igHI/ZtpwfsQJGmtbSCL1GQDIrGdKo7YCMS
 laPCkCkds9lEI+LNwHbLTiPZx507dZ8VdIttxG4/BF4Vyfp3qDUpRVQwTuPDuxWWEIsPDDXh5IU
 nA/0t2qWHVuhoGihTQ7Gbhz9pGBdkZsbGVGAQykza9o1mQW1zHn7zFfbsVtlKU7rK6eCEtRFDc2
 GLyFjzoZpC7jqr8Q/Q7qfAj/wPbBRGH82D4AJUY30HkZNqyUlH3JYtvopTfLVAvOiFF/U+aWFu/
 Q3cI7pZLZQJkX9ViYWSpidrKzAJsBt0gwqZRbBuPPZHT0P4l7nJqnGLMyUQOc7+d76gwQh8Hi1Y
 SH5lLXak71Rjalmw==
X-Google-Smtp-Source: AGHT+IFxlu0dGYyZ0OR2t4e3UxMOdqisZjIAo/bgT3egjX/1jqRrOdQbJ5C0zIWcx5YhoZUyiTy5Wg==
X-Received: by 2002:a17:906:2612:b0:b76:b632:1123 with SMTP id
 a640c23a62f3a-b76b63214demr1036789966b.42.1764236971612; 
 Thu, 27 Nov 2025 01:49:31 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f5162093sm123547366b.2.2025.11.27.01.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 01:49:31 -0800 (PST)
Date: Thu, 27 Nov 2025 10:49:28 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aSgeqM3DWvR8-cMY@pathway.suse.cz>
References: <20251121-printk-cleanup-part2-v2-0-57b8b78647f4@suse.com>
 <20251121-printk-cleanup-part2-v2-4-57b8b78647f4@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251121-printk-cleanup-part2-v2-4-57b8b78647f4@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-11-21 15:50:36, Marcos Paulo de Souza wrote: >
 Since commit 9e70a5e109a4 ("printk: Add per-console suspended state") > the
 CON_SUSPENDED flag was introced, and this flag was being checked [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.50 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vOYdD-0000FR-Bw
Subject: Re: [Kgdb-bugreport] [PATCH v2 4/4] printk: Make console_{suspend,
 resume} handle CON_SUSPENDED
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

On Fri 2025-11-21 15:50:36, Marcos Paulo de Souza wrote:
> Since commit 9e70a5e109a4 ("printk: Add per-console suspended state")
> the CON_SUSPENDED flag was introced, and this flag was being checked
> on console_is_usable function, which returns false if the console is
> suspended.
> 
> To make the behavior consistent, change show_cons_active to look for
> consoles that are not suspended, instead of checking CON_ENABLED.
> 
> --- a/drivers/tty/tty_io.c
> +++ b/drivers/tty/tty_io.c
> @@ -3554,7 +3554,7 @@ static ssize_t show_cons_active(struct device *dev,
>  			continue;
>  		if (!(c->flags & CON_NBCON) && !c->write)
>  			continue;
> -		if ((c->flags & CON_ENABLED) == 0)
> +		if (c->flags & CON_SUSPENDED)

I believe that we could and should replace

		if (!(c->flags & CON_NBCON) && !c->write)
			continue;
		if (c->flags & CON_SUSPENDED)
			continue;

with

		if (!console_is_usable(c, c->flags, true) &&
		    !console_is_usable(c, c->flags, false))
			continue;

It would make the value compatible with all other callers/users of
the console drivers.

The variant using two console_is_usable() calls with "true/false"
parameters is inspited by __pr_flush().

>  			continue;
>  		cs[i++] = c;
>  		if (i >= ARRAY_SIZE(cs))
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index fed98a18e830..fe7c956f73bd 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3542,7 +3542,7 @@ void console_suspend(struct console *console)
>  {
>  	__pr_flush(console, 1000, true);
>  	console_list_lock();
> -	console_srcu_write_flags(console, console->flags & ~CON_ENABLED);
> +	console_srcu_write_flags(console, console->flags | CON_SUSPENDED);

This is the same flag which is set also by the console_suspend_all()
API. Now, as discussed at
https://lore.kernel.org/lkml/844j4lepak.fsf@jogness.linutronix.de/

   + console_suspend()/console_resume() API is used by few console
     drivers to suspend the console when the related HW device
     gets suspended.

   + console_suspend_all()/console_resume_all() is used by
     the power management subsystem to call down/up all consoles
     when the system is going down/up. It is a big hammer approach.

We need to distinguish the two APIs so that console drivers which were
suspended by both APIs stay suspended until they get resumed by both
APIs. I mean:

	// This should suspend all consoles unless it is not disabled
	// by "no_console_suspend" API.
	console_suspend_all();
	// This suspends @con even when "no_console_suspend" parameter
	// is used. It is needed because the HW is going to be suspended.
	// It has no effect when the consoles were already suspended
	// by the big hammer API.
	console_suspend(con);

	// This might resume the console when "no_console_suspend" option
	// is used. The driver should work because the HW was resumed.
	// But it should stay suspended when all consoles are supposed
	// to stay suspended because of the big hammer API.
	console_resume(con);
	// This should resume all consoles.
	console_resume_all();

Other behavior would be unexpected and untested. It might cause regression.

I see two solutions:

   + add another CON_SUSPENDED_ALL flag
   + add back "consoles_suspended" global variable

I prefer adding back the "consoles_suspended" global variable because
it is a global state...

The global state should be synchronized the same way as the current
per-console flag (write under console_list_lock, read under
console_srcu_read_lock()).

Also it should be checked by console_is_usable() API. Otherwise, we
would need to update all callers.

This brings a challenge how to make it safe and keep the API sane.
I propose to create:

  + __console_is_usable() where the "consoles_suspended" value will
    be passed as parameter. It might be used directly under
    console_list_lock().

  + console_is_usable() with the existing parameters. It will check
    the it was called under console_srcu_read_lock, read
    the global "consoles_suspend" and pass it to
    __console_is_usable().


>  	console_list_unlock();
>  
>  	/*

I played with the code to make sure that it looked sane
and I ended with the following changes on top of this patch.

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 1b2ce0f36010..fda4683d12f1 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -3552,9 +3552,8 @@ static ssize_t show_cons_active(struct device *dev,
 	for_each_console(c) {
 		if (!c->device)
 			continue;
-		if (!(c->flags & CON_NBCON) && !c->write)
-			continue;
-		if (c->flags & CON_SUSPENDED)
+		if (!__console_is_usable(c, c->flags, consoles_suspended, true) &&
+		    !__console_is_usable(c, c->flags, consoles_suspended, false))
 			continue;
 		cs[i++] = c;
 		if (i >= ARRAY_SIZE(cs))
diff --git a/include/linux/console.h b/include/linux/console.h
index 5f17321ed962..090490ef570f 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -496,6 +496,7 @@ extern void console_list_lock(void) __acquires(console_mutex);
 extern void console_list_unlock(void) __releases(console_mutex);
 
 extern struct hlist_head console_list;
+extern bool consoles_suspended;
 
 /**
  * console_srcu_read_flags - Locklessly read flags of a possibly registered
@@ -548,6 +549,47 @@ static inline void console_srcu_write_flags(struct console *con, short flags)
 	WRITE_ONCE(con->flags, flags);
 }
 
+/**
+ * consoles_suspended_srcu_read - Locklessly read the global flag for
+ *				suspending all consoles.
+ *
+ * The global "consoles_suspended" flag is synchronized using console_list_lock
+ * and console_srcu_read_lock. It is the same approach as CON_SUSSPENDED flag.
+ * See console_srcu_read_flags() for more details.
+ *
+ * Context: Any context.
+ * Return: The current value of the global "consoles_suspended" flag.
+ */
+static inline short consoles_suspended_srcu_read(void)
+{
+	WARN_ON_ONCE(!console_srcu_read_lock_is_held());
+
+	/*
+	 * The READ_ONCE() matches the WRITE_ONCE() when "consoles_suspended"
+	 * is modified with consoles_suspended_srcu_write().
+	 */
+	return data_race(READ_ONCE(consoles_suspended));
+}
+
+/**
+ * consoles_suspended_srcu_write - Write the global flag for suspending
+ *			all consoles.
+ * @suspend:	new value to write
+ *
+ * The write must be done under the console_list_lock. The caller is responsible
+ * for calling synchronize_srcu() to make sure that all callers checking the
+ * usablility of registered consoles see the new state.
+ *
+ * Context: Any context.
+ */
+static inline void consoles_suspended_srcu_write(bool suspend)
+{
+	lockdep_assert_console_list_lock_held();
+
+	/* This matches the READ_ONCE() in consoles_suspended_srcu_read(). */
+	WRITE_ONCE(consoles_suspended, suspend);
+}
+
 /* Variant of console_is_registered() when the console_list_lock is held. */
 static inline bool console_is_registered_locked(const struct console *con)
 {
@@ -617,13 +659,15 @@ extern bool nbcon_kdb_try_acquire(struct console *con,
 extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
 
 /*
- * Check if the given console is currently capable and allowed to print
- * records. Note that this function does not consider the current context,
- * which can also play a role in deciding if @con can be used to print
- * records.
+ * This variant might be called under console_list_lock where both
+ * @flags and @all_suspended flags can be read directly.
  */
-static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
+static inline bool __console_is_usable(struct console *con, short flags,
+				       bool all_suspended, bool use_atomic)
 {
+	if (all_suspended)
+		return false;
+
 	if (!(flags & CON_ENABLED))
 		return false;
 
@@ -666,6 +710,20 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
 	return true;
 }
 
+/*
+ * Check if the given console is currently capable and allowed to print
+ * records. Note that this function does not consider the current context,
+ * which can also play a role in deciding if @con can be used to print
+ * records.
+ */
+static inline bool console_is_usable(struct console *con, short flags,
+				     bool use_atomic)
+{
+	bool all_suspended = consoles_suspended_srcu_read();
+
+	return __console_is_usable(con, flags, all_suspended, use_atomic);
+}
+
 #else
 static inline void nbcon_cpu_emergency_enter(void) { }
 static inline void nbcon_cpu_emergency_exit(void) { }
@@ -678,6 +736,8 @@ static inline void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt) { }
 static inline bool nbcon_kdb_try_acquire(struct console *con,
 					 struct nbcon_write_context *wctxt) { return false; }
 static inline void nbcon_kdb_release(struct nbcon_write_context *wctxt) { }
+static inline bool __console_is_usable(struct console *con, short flags,
+				       bool all_suspended, bool use_atomic) { return false; }
 static inline bool console_is_usable(struct console *con, short flags,
 				     bool use_atomic) { return false; }
 #endif
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 23a14e8c7a49..12247df07420 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -104,6 +104,13 @@ DEFINE_STATIC_SRCU(console_srcu);
  */
 int __read_mostly suppress_printk;
 
+/*
+ * Global flag for calling down all consoles during suspend.
+ * There is also a per-console flag which is used when the related
+ * device HW gets disabled, see CON_SUSPEND.
+ */
+bool consoles_suspended;
+
 #ifdef CONFIG_LOCKDEP
 static struct lockdep_map console_lock_dep_map = {
 	.name = "console_lock"
@@ -2731,8 +2738,6 @@ MODULE_PARM_DESC(console_no_auto_verbose, "Disable console loglevel raise to hig
  */
 void console_suspend_all(void)
 {
-	struct console *con;
-
 	if (console_suspend_enabled)
 		pr_info("Suspending console(s) (use no_console_suspend to debug)\n");
 
@@ -2749,8 +2754,7 @@ void console_suspend_all(void)
 		return;
 
 	console_list_lock();
-	for_each_console(con)
-		console_srcu_write_flags(con, con->flags | CON_SUSPENDED);
+	consoles_suspended_srcu_write(true);
 	console_list_unlock();
 
 	/*
@@ -2765,7 +2769,6 @@ void console_suspend_all(void)
 void console_resume_all(void)
 {
 	struct console_flush_type ft;
-	struct console *con;
 
 	/*
 	 * Allow queueing irq_work. After restoring console state, deferred
@@ -2776,8 +2779,7 @@ void console_resume_all(void)
 
 	if (console_suspend_enabled) {
 		console_list_lock();
-		for_each_console(con)
-			console_srcu_write_flags(con, con->flags & ~CON_SUSPENDED);
+		consoles_suspended_srcu_write(false);
 		console_list_unlock();
 
 		/*

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
