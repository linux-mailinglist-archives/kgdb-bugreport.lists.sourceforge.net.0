Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4949F3FBFF6
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 31 Aug 2021 02:34:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mKriz-0008Hq-IL
	for lists+kgdb-bugreport@lfdr.de; Tue, 31 Aug 2021 00:34:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <senozhatsky@chromium.org>) id 1mKriy-0008Ha-Up
 for kgdb-bugreport@lists.sourceforge.net; Tue, 31 Aug 2021 00:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TjFdVibCziMMV625QJ8En+pQePJGwxqOLzHHo+cR/2g=; b=MiLFw1MIk0wJe3f1QhfKZ83xkB
 wRig9/N6DY8GG9gDSggw1G3aKNK98kMPjzMGlqWX387oiBT+yAZP7pgKbVrngCPoJqDdDfK2vbMHA
 NX9ysH//QkLGge2vRxCKrAa3O0Gdy6b66CbTKfC2+q4URKgimxjvPd6x8Dzy7DsE77tc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TjFdVibCziMMV625QJ8En+pQePJGwxqOLzHHo+cR/2g=; b=Bhms6EN8FeUdM7r9luhGyUljgx
 UHoa13X4J8I3jCAiE2WR8Ak+68gIqPgbfL4o+KhOqgVzizW1asPMXWwPxs/EjYJ+CwzhiXhtFn99F
 ZHgvkofuaQh9B9mHc0cPUg4WZeXziePl028hERjSoG2WmA4zqO0bou+YQa/1L+bqZZMw=;
Received: from mail-pj1-f41.google.com ([209.85.216.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mKriu-008RzS-Gi
 for kgdb-bugreport@lists.sourceforge.net; Tue, 31 Aug 2021 00:34:00 +0000
Received: by mail-pj1-f41.google.com with SMTP id
 f11-20020a17090aa78b00b0018e98a7cddaso1161255pjq.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 30 Aug 2021 17:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TjFdVibCziMMV625QJ8En+pQePJGwxqOLzHHo+cR/2g=;
 b=AzDcWKGtdHyMnoIEjzFPFQjRSRfN6cZcyUfqyg+1RFft/sQblgaz4y7UB0acXhUsAk
 aYq77Xwd7EMjSfEApWR3a558fJLQOEbjXYD1SI5rTv8NJMwK07Xba20kndQ9K5z7nQNv
 VqF6GPhvubvT3lLK/TsJYcG7uj5cuYcL5eVI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TjFdVibCziMMV625QJ8En+pQePJGwxqOLzHHo+cR/2g=;
 b=PrmXipBJjrB2uAtIodidSqsucuPjpHZ+OTemr+clLoZbVRRt3A4eqlIOSUy/PaGs8q
 bRFyLt5ia+jWn6I4Vil1g14kHOJYBrbshMI8R4alzYbbH5JQCW1nUgAJ+dyThqvDXv8r
 UG5FrWcBMI8gjwdZPbl6rJ1slKLLfWulirP3bCjbe64iaLN7QEpRZ4I5HAl0p/D6S4bA
 YW2nyUZuYzMFATNV7DazaSHF0u8Z6rfw0rloIvZge4rZok8oq7+vw1wrnfs6aLzZisE9
 uTZzqfaeOee7479DRhfGwxhsGArHVf+KCYPBtuQai6Suc04K0RPtNyrEEXLcLcYbkInL
 eASQ==
X-Gm-Message-State: AOAM531ujF0KMlA4rZ3YQYuuul2mIKlE7qxogMKcI+BVr8fNZU/7cCSN
 kNmY0lpv4h9m1VAHerbrDxOAuw==
X-Google-Smtp-Source: ABdhPJxdbxW4ryHv5bhuf8dsnrqkWswjsDidSV0lyn6xogTwXPWUAw0uITGdywWoWH5lbvCpqEzDjw==
X-Received: by 2002:a17:90a:bc47:: with SMTP id
 t7mr2025742pjv.19.1630370030908; 
 Mon, 30 Aug 2021 17:33:50 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:69ed:b45b:ceb5:e18b])
 by smtp.gmail.com with ESMTPSA id q12sm15915318pfj.153.2021.08.30.17.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 17:33:50 -0700 (PDT)
Date: Tue, 31 Aug 2021 09:33:36 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <YS144PMiCJnmoKE4@google.com>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <YQwHwT2wYM1dJfVk@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQwHwT2wYM1dJfVk@alley>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On (21/08/05 17:47),
 Petr Mladek wrote: [..] > 3. After introducing
 console kthread(s): > > int printk(...) > { > vprintk_store();
 > wake_consoles_via_irqwork(); 
 > } > > + in panic: > > + with atomic [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.41 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.41 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mKriu-008RzS-Gi
Subject: Re: [Kgdb-bugreport] [PATCH printk v1 00/10] printk: introduce
 atomic consoles and sync mode
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Al Cooper <alcooperx@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Cengiz Can <cengiz@kernel.wtf>,
 Chengyang Fan <cy.fan@huawei.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 John Ogness <john.ogness@linutronix.de>, Changbin Du <changbin.du@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 x86@kernel.org, linux-mediatek@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, linux-mips@vger.kernel.org,
 Wang Qing <wangqing@vivo.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Johan Hovold <johan@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sedat Dilek <sedat.dilek@gmail.com>, Claire Chang <tientzu@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrij Abyzov <aabyzov@slb.com>, linux-arm-kernel@lists.infradead.org,
 kuldip dwivedi <kuldip.dwivedi@puresoftware.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zhang Qilong <zhangqilong3@huawei.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Guenter Roeck <linux@roeck-us.net>, Jason Wessel <jason.wessel@windriver.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, linuxppc-dev@lists.ozlabs.org,
 Vitor Massaru Iha <vitor@massaru.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On (21/08/05 17:47), Petr Mladek wrote:
[..]
> 3. After introducing console kthread(s):
> 
> 	int printk(...)
> 	{
> 		vprintk_store();
> 		wake_consoles_via_irqwork();
> 	}
> 
> 	+ in panic:
> 
> 	    + with atomic console like after this patchset?
> 	    + without atomic consoles?
> 
> 	+ during early boot?

I guess I'd also add netconsole to the list.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
