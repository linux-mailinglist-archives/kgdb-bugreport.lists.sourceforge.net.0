Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 930DB1DB153
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 20 May 2020 13:17:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jbMjU-00039t-Cg
	for lists+kgdb-bugreport@lfdr.de; Wed, 20 May 2020 11:17:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sergey.senozhatsky@gmail.com>) id 1jbMjT-00039c-Fx
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 11:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:Date:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G9jhMLSlbbRWBPFkiGcwNA69qHZJzJ0AW02rtZSNSek=; b=QMAbNiDd50KqafqUw6knl+mdL0
 wEBKbKE3HQ3J70aGKZwcHAflzQCtXtWxML/nauQZ9NLEFHsRXa4a2iXXeACcJG7xb2JOXNUE3nggc
 Ww7T/ZkZupqhdggXp0+6cMCYX3WUxbpq0bBReG9iv27gOJWSoP8QEi5UBJvsFILkbvsg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :Date:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G9jhMLSlbbRWBPFkiGcwNA69qHZJzJ0AW02rtZSNSek=; b=FEmstYAIsUKPfHcPYKrWFGNN1n
 EBR2eiKBGPtnTzhd6RoDi+er6LpMVdj7vYupbmiC87rZutRMQazagGzHYuz+2QF8gOBaza9tEPKNa
 YSI8jZhl+RIniQRL90TVbOhKJeZ+CW8HpjI4FDnyek19ypuflVQxM8tU1dUZf6fWC//c=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbMjS-00GXR9-9K
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 11:17:55 +0000
Received: by mail-pg1-f193.google.com with SMTP id u35so1279940pgk.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 20 May 2020 04:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G9jhMLSlbbRWBPFkiGcwNA69qHZJzJ0AW02rtZSNSek=;
 b=HrWi5oHJs6KG0TnjQSTOJ04Qm8KbWmxtVcZBF5c3JhUMZljPumg7wlWtu1EQ2ff2ht
 THAOlS5+DB9E9yy2+PSvNvTVKUbHSGfzo07tr2CCCE8heT/cQUrLzll+kvrKdclThJIL
 q2LtnI5Cj81ZgJXMwt28k3gfzCenwzUr0nNrBr2J5LoUsLsdhaq6ziDgdo+E47vhGEi7
 AAOUewCCwVkCtQ7tWlDu4NWo6Wl03kRXAVcRfv0IAwjaIyQSOPPsjXTeasjYVs1N1cYg
 PLJ3+lB5K4RMqHe0Md7C9BYx7xGQr2bJo2m3eOl+aTdqd97v9Sr5cLMNj/TriqWwpY0Z
 PPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G9jhMLSlbbRWBPFkiGcwNA69qHZJzJ0AW02rtZSNSek=;
 b=Y/0LNk5mk5n1t/mfrU9gaB88vvObg5juPIFo0w/G8au4BRjheyV/mI8WezA+r7UJyT
 aGUmT3FNCuBQyn+q0a5ARaaT76FjtzwQEWIqc8/VQKpRayrgd0dYkjuZWz9+m/KyRXgq
 3kJz/vB7v3eTPKSg0ALKH68LKTFf+Ze4uBl4UxCGHgpK+Kk7KvNPd+F3BMqWLd23JTWN
 aktubPvcsZQ/00uIcQx6IHA0VVkQ9a+/b0YXujtcU70BF/yFVPGMxTWVnmM0BhGk0Ml3
 4kTJ7K6a3SoomXTi6+kRsNcfYadWzqtcO6Yz3odGhD6143BHCzTJDnX0OPjp+4RVWEre
 5O7A==
X-Gm-Message-State: AOAM530vZMw+NyUVR2ICymTNf2QzWyoWCtMv8yw5LziV+J+AfrWG5xhU
 SPcYluvJS86qnfLjgADEakI=
X-Google-Smtp-Source: ABdhPJyX44rVAqEouWz5zdqFz0iyoiBYEjg0TYxUEUAoXZr9buZWGPmsQvjC9HGlkPRy7cTN8md9Bw==
X-Received: by 2002:a63:7d58:: with SMTP id m24mr3500311pgn.81.1589973468726; 
 Wed, 20 May 2020 04:17:48 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id q7sm1709586pgs.13.2020.05.20.04.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 04:17:48 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Wed, 20 May 2020 20:17:46 +0900
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20200520111746.GB520@jagdpanzerIV.localdomain>
References: <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
 <20200514084230.GO17734@linux-b0ei>
 <CAFA6WYPSsgdAB-wJC0e2YkVkW0XsqQsu5wrn4iB4M-cwvS7z2g@mail.gmail.com>
 <20200515085021.GS17734@linux-b0ei>
 <20200515103308.GD42471@jagdpanzerIV.localdomain>
 <20200515134806.5cw4xxnxw7k3223l@holly.lan>
 <20200518092139.GK7340@linux-b0ei>
 <20200520042102.GA938@jagdpanzerIV.localdomain>
 <20200520093557.lwwxnhvgmacipdce@holly.lan>
 <20200520102233.GC3464@linux-b0ei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520102233.GC3464@linux-b0ei>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (sergey.senozhatsky[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jbMjS-00GXR9-9K
Subject: Re: [Kgdb-bugreport] [PATCH v2] printk/kdb: Redirect printk
 messages into kdb in any context
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 John Ogness <john.ogness@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On (20/05/20 12:22), Petr Mladek wrote:
> kdb has to get messages on consoles even when the system is stopped.
> It uses kdb_printf() internally and calls console drivers on its own.
> 
> It uses a hack to reuse an existing code. It sets "kdb_trap_printk"
> global variable to redirect even the normal printk() into the
> kdb_printf() variant.
> 
> The variable "kdb_trap_printk" is checked in printk_default() and
> it is ignored when printk is redirected to printk_safe in NMI context.
> Solve this by moving the check into printk_func().
> 
> It is obvious that it is not fully safe. But it does not make things
> worse. The console drivers are already called in this context by
> db_printf() direct calls.
> 
> Reported-by: Sumit Garg <sumit.garg@linaro.org>
> Tested-by: Sumit Garg <sumit.garg@linaro.org>
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Acked-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

	-ss


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
