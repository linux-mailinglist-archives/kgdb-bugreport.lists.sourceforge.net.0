Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAF/No5E52ls6AEAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Apr 2026 11:34:06 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD808438EB7
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Apr 2026 11:34:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlm50ttFrVXsCZx++VhxNhB5+Cnsvjr0PAl0iSGGSiI=; b=Sh54AT0k/Ndm88JhRJz/qNcr4S
	Suuw0YvgkvPPIevhMIB6yMFc2DflTazmiJrqEmGKeqx4R8J6+O2Rh/OZqKp2nVwJiUfG5Vr/aGNPP
	H8QrIX+BHN0/jC9PEDjUwaujNurJg6Ym6w0KzScqNfiYdnfehPJwbK/WvM3JG8lqAktA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wF7UZ-0000Y3-Nk
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 21 Apr 2026 09:34:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1wF7UY-0000Xr-Ng
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 21 Apr 2026 09:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bq9QG9cvLvgk2UCX7BCWel9Xe8wLb+Jo7joT5Pt0764=; b=R/ouaKW6QIaJhSDOedP5wMsLMA
 wbVzuTHlpVQmXvFqF/eo4NHMlfSnEOEjjuqclEvkLZZh9TuPc5zhY54MQbdWIFJSo7FTdZy0Iyato
 FttJSPdUptihzkIt9/Vr9lav8Y8Y5bet2F1ogdpNWzzgEo7cExafGMHk32RKbrsY+I2o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bq9QG9cvLvgk2UCX7BCWel9Xe8wLb+Jo7joT5Pt0764=; b=JrFwcqvxXlnKhOhzLgiH6Lhtgm
 nKF7vlRqS7tKv7/df+hxgvVw9bV9KM5khvtH7Kgcm+e628HOxW0vzbozUv8rqc7Jm0/pd3Ujwg4zY
 nqAWTyKlGqiTsbp2OqmMhyriMmq9uUNcHBhkBjMjSy6d4W4t15N2mlPocbxAJR9i8Xvc=;
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wF7UV-0000Vs-HR for kgdb-bugreport@lists.sourceforge.net;
 Tue, 21 Apr 2026 09:34:03 +0000
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-66d65646c65so6835245a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 21 Apr 2026 02:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1776764028; x=1777368828; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Bq9QG9cvLvgk2UCX7BCWel9Xe8wLb+Jo7joT5Pt0764=;
 b=aO6gAwn2X8jksgoPePvfTTDpoLBholB6oLiJYut+pQvJXHtvwQNEjvZootRNr5fmw2
 3VzWuBdH1eDFrL3Mm4Acm4vuR5iogWni9nqIbeb+uVmnQFd971hnuaMPdrDUlCuOqd3V
 v+HcBKabJrglbX7O6cGL9+3mz0UTucQDaze7ro2c2Fx84LX8PQ3IbLJu3ub/j3OpoN6c
 7aBfjEBDSoS33QXyDMmcd/EGYq4qkkqkIjlpWANIKBcw0Ln3eX787mm4SnJhXgVEV0sc
 1Cb2YislXPNlNq8cffgeOb6w38vYiGo+AtUmOR+h0vJNbcVJQB6c9cdeR955gOZ9UAer
 4N1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776764028; x=1777368828;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bq9QG9cvLvgk2UCX7BCWel9Xe8wLb+Jo7joT5Pt0764=;
 b=sVmFhqKuDYo16gMsgUoEHbnqMDZMBp2i0QmpvK2CqPpjOVYOHlpToQ8BBePfSz/M8i
 PgJJNrOMRW1ZxUcbw+D4LHqyS9vXPLHk/AmELaqgAo0Sr32u1AkAubO/AJdSimFJXLo3
 f+Wp/qdKiYIgI+SYBogJw9lWifHmXzJ1eligguYqgTV8oHqXcQzSPR63x1oS3KWgQ1La
 vm9KzWxdSpXaIZSW9RpCRfIqsUarXKD0Fp+A7CDBTtDRXJBsHAu/K04WVpd1IgG9fVdE
 AS9INz+4NbWUn9GkcM3oitd+wUzEwgRwRaABMGv8YtLFTh/diPkunnSuFw00DJSnU9AI
 1JRA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Jkjdx54jYZb13EIQ5svC48SbBjkKlw2wjhDnR69QoSM7gi3kJ0C+lR8Qn3fpzLIjaIiNOGPLbUrYshecMjQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzcTsOD/qMpHxpXKWp9V5wwdHGuCP5ZnZ6v714/kGIKbYP/zJC8
 UYquGW0xLZThUj4b9DjcjxkWHI/gVCLvwhJZPwyDIarsQf+C4NZXzkysi2wmNwNc8x6S9se12Kw
 xvj4sfVsYPQ==
X-Gm-Gg: AeBDieuQ5WLKsSDct7Y3r2wHlKaNtSwLBJ7dTzzTmHZR1uKrPK7tDte1qtAGjUQw6gg
 /Gxewh6394R4VHpiXDD9SWmT5De9hmtut+MyBkcwp13OQ2/LNbd5cp8wSqRpGpabUS4QP18vrQ+
 z0isSUJzzkL5OTFOBeTFihcp8p1PPiPM3jSepFyCCjIEaWwXii1wEMv4PaQPVK3utrFbn0IBh0e
 D+8rRg7fI5mwLYRtdB1ldhP49PPuypfhd4/pG2VcOgCvOhs/Hap1a7lirV4s4QmFyhFbl/6wRtZ
 bvLKvifsBRoE9gj7PuqyETEGTczysvPIyEPnvRShmnZFIzBLhAHSli0UGvGRq5nY25VpdsHw/PS
 K+pWmQcTNdBWFjCDsBAjGm2j1XZdTw4YtZ3wMl4Wvu5aHAqEU0Xhw0Z2vPBmeCFaVh9Y/QQ1+gk
 gP6C7MbWh6D+TLCWeQ6tl4Zi99M8Jki64A7FCFI725mShutm30nUg=
X-Received: by 2002:a5d:5c81:0:b0:43d:729e:f23a with SMTP id
 ffacd0b85a97d-43fe408dab9mr19081632f8f.22.1776762324596; 
 Tue, 21 Apr 2026 02:05:24 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb135asm39945351f8f.6.2026.04.21.02.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2026 02:05:24 -0700 (PDT)
Date: Tue, 21 Apr 2026 11:05:21 +0200
To: Masami Hiramatsu <mhiramat@kernel.org>
Message-ID: <aec90caYZDHDAHgw@pathway.suse.cz>
References: <20260415070137.17860-1-chensong_2000@189.cn>
 <20260420144429.57b45f2beece690bceea96ec@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260420144429.57b45f2beece690bceea96ec@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 2026-04-20 14:44:29, Masami Hiramatsu wrote: > Hi Song,
 > > On Wed, 15 Apr 2026 15:01:37 +0800 > chensong_2000@189.cn wrote: > >
 > From: Song Chen <chensong_2000@189.cn> > > > > The current not [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.44 listed in wl.mailspike.net]
X-Headers-End: 1wF7UV-0000Vs-HR
Subject: Re: [Kgdb-bugreport] [RFC PATCH 1/2] kernel/notifier: replace
 single-linked list with double-linked list for reverse traversal
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
Cc: mark.rutland@arm.com, rafael@kernel.org, viresh.kumar@linaro.org,
 mturquette@baylibre.com, linux-kernel@vger.kernel.org, song@kernel.org,
 edumazet@google.com, da.gomez@kernel.org, live-patching@vger.kernel.org,
 mbenes@suse.cz, linux-clk@vger.kernel.org, agk@redhat.com,
 joe.lawrence@redhat.com, atomlin@atomlin.com, linux-acpi@vger.kernel.org,
 danielt@kernel.org, samitolvanen@google.com,
 kgdb-bugreport@lists.sourceforge.net, kuba@kernel.org, pabeni@redhat.com,
 linan122@huawei.com, lenb@kernel.org, dm-devel@lists.linux.dev,
 petr.pavlu@suse.com, paulmck@kernel.org, linux-pm@vger.kernel.org,
 frederic@kernel.org, jikos@kernel.org, snitzer@kernel.org, rostedt@goodmis.org,
 linux-raid@vger.kernel.org, mpatocka@redhat.com, yukuai@fnnas.com,
 jpoimboe@kernel.org, sboyd@kernel.org, netdev@vger.kernel.org,
 chensong_2000@189.cn, mcgrof@kernel.org, horms@kernel.org,
 jason.wessel@windriver.com, mathieu.desnoyers@efficios.com,
 bmarzins@redhat.com, linux-trace-kernel@vger.kernel.org, davem@davemloft.net,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.com:s=google];
	RCVD_COUNT_FIVE(0.00)[5];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,linaro.org,baylibre.com,vger.kernel.org,google.com,suse.cz,redhat.com,atomlin.com,lists.sourceforge.net,huawei.com,lists.linux.dev,suse.com,goodmis.org,fnnas.com,189.cn,windriver.com,efficios.com,davemloft.net];
	RCPT_COUNT_TWELVE(0.00)[46];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.com:-];
	FROM_NEQ_ENVFROM(0.00)[kgdb-bugreport@lists.sourceforge.net,kgdb-bugreport-bounces@lists.sourceforge.net];
	TAGGED_RCPT(0.00)[kgdb-bugreport];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PREVIOUSLY_DELIVERED(0.00)[kgdb-bugreport@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[pmladek@suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:replyto,189.cn:email]
X-Rspamd-Queue-Id: CD808438EB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon 2026-04-20 14:44:29, Masami Hiramatsu wrote:
> Hi Song,
> 
> On Wed, 15 Apr 2026 15:01:37 +0800
> chensong_2000@189.cn wrote:
> 
> > From: Song Chen <chensong_2000@189.cn>
> > 
> > The current notifier chain implementation uses a single-linked list
> > (struct notifier_block *next), which only supports forward traversal
> > in priority order. This makes it difficult to handle cleanup/teardown
> > scenarios that require notifiers to be called in reverse priority order.
> 
> What about introducing a new notification callback API that allows you
> to describe dependencies between callback functions?
> 
> For example, when registering a callback, you could register a string
> as an ID and specify whether to call it before or after that ID,
> or you could register a comparison function that is called when adding
> to a list. (I prefer @name and @depends fields so that it can be easily
> maintained.)

This looks too complex. It would make sense only
when this API has more users.

Also this won't be enough for the ftrace/livepatch callbacks.
They need to be ordered against against each other. But they
also need to be called before/after all other callbacks.
For example, when the module is loaded:

   + 1st frace
   + 2nd livepatch
   + then other notifiers

See the commit c1bf08ac26e92122 ("ftrace: Be first to run code
modification on modules").

> This would allow for better dependency building when adding to the list.
 
> > 
> > A concrete example is the ordering dependency between ftrace and
> > livepatch during module load/unload. see the detail here [1].
> 
> If this only concerns notification callback issues with the ftrace
> and livepatch modules, it's far more robust to simply call the
> necessary processing directly when the modules load and unload,
> rather than registering notification callbacks externally.
> 
> There are fprobe, kprobe and its trace-events, all of them are using
> ftrace as its fundation layer. In this case, I always needs to
> consider callback order when a module is unloaded.
> 
> If ftrace is working as a part of module callbacks, it will conflict
> with fprobe/kprobe module callback. Of course we can reorder it with
> modifying its priority. But this is ugly, because when we introduce
> a new other feature which depends on another layer, we need to
> reorder the callback's priority number on the list.
> 
> Based on the above, I don't think this can be resolved simply by
> changing the list of notification callbacks to a bidirectional list.

I agree. I would keep it as is (hardcoded).

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
