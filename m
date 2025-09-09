Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BB6B4FF35
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 Sep 2025 16:21:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmREJmxdHN+hF9N4Zj3q0FyEB42dexawBvMuHLWDTdM=; b=de7bGLBm0Ftx9HmgR0dVSzcMza
	kPW495u/mU/dRKj9hMfuefWp1QdcXrjk2vYi/ykQ0JAEnpp34RpuMQFLgmp6qqruN4j/Sj6sLRrYo
	NJgvoLJ5SLtfx6GgpXC0l6q9gDRycoDCsUn/JCsFmAeSdfGNd0Fn9zaehlk6OMDZVH4w=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uvzE1-0001uk-PW
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 Sep 2025 14:21:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uvzDv-0001u5-8L
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Sep 2025 14:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z9XzVsrF/2kVcEs9PtV7OlqggBEMEvqZHeycAS9T7Mw=; b=fleSJqHcVyXoiKm4YC3aq4q/5l
 lSsfd90SaM5M9In+llw2PlywcMt4SEgFGLV7nplFyN9ZLHgZwjw9i2hJLevbNYiG43abO6XNyYiFw
 0yjTeMYeXcuQZGBBbOx3wjsUqhh30Mqyk8nVO/NW7XCsp6WK7wIs/a8MxepL6STAYNn0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z9XzVsrF/2kVcEs9PtV7OlqggBEMEvqZHeycAS9T7Mw=; b=O8JXjLVr2oF7aK6DEKKNzGnUfm
 Lcfoj/Zr+VQvYsB8xVfHrpJ66BDm+9G7MxIZTZV6IN1uWz+xYpBAzb/Yfs5JYOdWFZmmvjSHNaJMg
 eO62r+ABM67sG/C0A+pcuTvTAEzJNbCgSPr6ALm1EhDGN842HL68MPrdoKkQ3NEhSOxo=;
Received: from mail-ej1-f43.google.com ([209.85.218.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uvzDv-0002w9-J6 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Sep 2025 14:21:31 +0000
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b046fc9f359so1018931966b.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 09 Sep 2025 07:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1757427685; x=1758032485; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=z9XzVsrF/2kVcEs9PtV7OlqggBEMEvqZHeycAS9T7Mw=;
 b=QRl1L5TFvx1+zPgvhYvLpuuUcbr+fG2oMwzhL3IEm6UPnp2V/VmUFatuqL4B3a2sR/
 obOfCsHGZZ+UTBMcXW+lsv2zLKdlBVr/PjID77YiI5cbUhy2VizPRrXPyj9HHyADAOs8
 yTaA9d7ORTDyQZMUVdU3MeptXw+k9RNKgEP9yTGEaDFO8JWp9+fHYT1bWANpokEeT/Z6
 aQ0HcWQXI7YlsfhRy4W2ILZ+1Kreexr6jGbM6VJMfhvqDmVA+jj8ulK9h3+XR1z8aDTq
 WGAYm98Fb974zolH24Ohr1LHkPJUq5RcazRVYqvLnt2467bZTXYdv6BNjjG5fQVK06ga
 TRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757427685; x=1758032485;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z9XzVsrF/2kVcEs9PtV7OlqggBEMEvqZHeycAS9T7Mw=;
 b=hUuqcdAIdHwC1pW/SiuQmcVzx3ph3zuvF3B07PFYbqT0SxHG5tIzwQed5JZbrVTj/j
 JqsoL8BkzXxbE2KodTNvaBPXg8geeczsz/YLMpRUbxYzEUrVx64VlaQN/8hnX6Kn3ocv
 /IzuGyiT6sfA3DdAxvfDdO25W9Fqz6EzndGMs7LXyVGGqTT7YNaw5qfqYWxL1HNUB9du
 jsWcJHmVEOQI+1tQLQmpUS2OggXDyUk/J6WRja41uAVY7Smlvl+Oc8N1muMmjbG+ZPZ4
 Ez4Svtf6rQfSeaNVpSQ2SRJ0Yyn/38SJFDBoqEDSCeaEZlYGXR1DL46zUeloDUEXEQee
 Iytw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQDV694p2VvXB5eA8fzExSbYDLYWmbsFcY+78WDbjJGCbPLEn0d/NZegUZMR2D7+9rZwKuGCgMmDe+vEQWVg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwpvdlOLNwSILSOvmfRvIVV7D610ZsQxpqIc70Z/Ok2294OWSbM
 5BVEfarM5gM2y5YGcIEskaEHG9ueCnyyDr/fg0SCoHKI4yJtdflrmRrQUA+8JGBAMu0=
X-Gm-Gg: ASbGncuu/NN4LOgh/XlRXsodgahuN6lLhv89zOQA9UxHCyOEY16QvN5cfXY1tJCQRW1
 2xgWptk8lJy0gxMNlr/HinFHR0XrxsCQBzVFRmomdHzAcIe/a5wBomDqqI+W4TJY7T/165C35HB
 kKypC/PsOhcAf19MXPDFHrY6fXluaqR054ZFrLq6tBSvopBe5EQq9KIA2mlxJY35KfRRiM/giMl
 /3m58lJpX9jJ39NbvGhpYx59T62rDcIXNH2AkOH8w9tOYm6mR0hiF4XHUUfXNhDXnGRShXZ4A+H
 kVE5Xed65WtSHJFApChpGltEgBdoxY/ActGdJjCgQhoFAdWZbawNIsbIV91BFwMr4D80+VfTxF7
 MfB4n2FYqS4l+EN2L0w6jJVqd3PlLI3FfVcoz
X-Google-Smtp-Source: AGHT+IFVx676s5fDldPoppGP+0iD62Fg0ydmFsY1JlJe8Cg8op6tEbpehOmgYitI9uLDtJtauCQmdg==
X-Received: by 2002:a17:907:c21:b0:afe:a446:b22e with SMTP id
 a640c23a62f3a-b04b13bbf13mr1201532366b.12.1757427684927; 
 Tue, 09 Sep 2025 07:21:24 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0466a962c4sm1591055666b.71.2025.09.09.07.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:21:24 -0700 (PDT)
Date: Tue, 9 Sep 2025 16:21:22 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <aMA34mPqHFC3v3Kf@pathway.suse.cz>
References: <20250902-nbcon-kgdboc-v3-0-cd30a8106f1c@suse.com>
 <20250902-nbcon-kgdboc-v3-2-cd30a8106f1c@suse.com>
 <aLsOBwV6CVBwG9JV@pathway.suse.cz>
 <84ikht87tn.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84ikht87tn.fsf@jogness.linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 2025-09-08 14:15:08,
 John Ogness wrote: > On 2025-09-05, 
 Petr Mladek <pmladek@suse.com> wrote: > > On Tue 2025-09-02 15:33:53, Marcos
 Paulo de Souza wrote: > >> These helpers will be used when [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.43 listed in wl.mailspike.net]
X-Headers-End: 1uvzDv-0002w9-J6
Subject: Re: [Kgdb-bugreport] [PATCH v3 2/4] printk: nbcon: Introduce KDB
 helpers
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marcos Paulo de Souza <mpdesouza@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon 2025-09-08 14:15:08, John Ogness wrote:
> On 2025-09-05, Petr Mladek <pmladek@suse.com> wrote:
> > On Tue 2025-09-02 15:33:53, Marcos Paulo de Souza wrote:
> >> These helpers will be used when calling console->write_atomic on
> >> KDB code in the next patch. It's basically the same implementaion
> >> as nbcon_device_try_acquire, but using NBCON_PORIO_EMERGENCY when
> >> acquiring the context.
> >> 
> >> For release we need to flush the console, since some messages could be
> >> added before the context was acquired, as KDB emits the messages using
> >> con->{write,write_atomic} instead of storing them on the ring buffer.
> >
> > I am a bit confused by the last paragraph. It is a very long sentence.
> >
> > Sigh, I wanted to propose a simple and clear alternative. But I ended
> > in a rabbit hole and with a rather complex text:
> >
> > <proposal>
> > The atomic flush in the release function is questionable. vkdb_printf()
> > is primary called only when other CPUs are quiescent in kdb_main_loop()
> > and do not call the classic printk(). But, for example, the
> > write_atomic() callback might print debug messages. Or there is
> > one kdb_printf() called in kgdb_panic() before other CPUs are
> > quiescent. So the flush might be useful. Especially, when
> > the kdb code fails to quiescent the CPUs and returns early.
> >
> > Let's keep it simple and just call __nbcon_atomic_flush_pending_con().
> > It uses write_atomic() callback which is used by the locked kdb code
> > anyway.
> >
> > The legacy loop (console_trylock()/console_unlock()) is not
> > usable in kdb context.
> >
> > It might make sense to trigger the flush via the printk kthread.
> > But it would not work in panic() where is the only known kdb_printf()
> > called when other CPUs are not quiescent. So, it does not look
> > worth it.
> > </proposal>
> >
> > What do you think?
> >
> > My opinion:
> >
> > Honestly, I think that the flush is not much important because
> > it will most offten have nothing to do.
> >
> > I am just not sure whether it is better to have it there
> > or avoid it. It might be better to remove it after all.
> > And just document the decision.
> 
> IMHO keeping the flush is fine. There are cases where there might be
> something to print. And since a printing kthread will get no chance to
> print as long as kdb is alive, we should have kdb flushing that
> console.
> 
> Note that this is the only console that will actually see the new
> messages immediately as all the other CPUs and quiesced.

I do not understand this argument. IMHO, this new
try_acquire()/release() API should primary flush only
the console which was (b)locked by this API.

It will be called in kdb_msg_write() which tries to write
to all registered consoles. So the other nbcon consoles will
get flushed when the try_acquire() succeeds on them. And the
legacy conosles were never flushed.

> For this reason
> we probably want to use __nbcon_atomic_flush_pending() to try to flush
> _all_ the consoles.

I would prefer to keep __nbcon_atomic_flush_pending_con().
I mean to flush only the console which was blocked.

Note that we would need to increment oops_in_progress if we wanted
to flush legacy consoles in this context... which would spread
the mess into nbcon code...

> As to the last paragraph of the commit message, I would keep it simple:
> 
> After release try to flush all consoles since there may be a backlog of
> messages in the ringbuffer. The kthread console printers do not get a
> chance to run while kdb is active.

I like this text.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
