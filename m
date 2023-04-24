Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D996ECD5C
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 24 Apr 2023 15:22:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pqw9h-0001Fv-W4
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 24 Apr 2023 13:22:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1pqw9g-0001Ff-Kj
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 24 Apr 2023 13:22:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y93RjN7osl+y397UDjyIqrYTNL58RSMeMDAuuxAAix4=; b=Z8G1s6P1nK6c1n71AoIdsOcez8
 YJNLWCvukBjm1Aqxdvqu2M3dV7ZvTB9IP2pv3LlWfFPgOhzc/x3pe3zBvSpK7lYANLEWnwB0iOzpf
 Pf4rc3tzhkx5kf1fHDF8bxaDscAdNUnjMS2Ll1FECOTeRFhs2i+ZOcmX5bpZlR6HsmWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y93RjN7osl+y397UDjyIqrYTNL58RSMeMDAuuxAAix4=; b=Ggl4CXs23CEmKlE3wyDEhuGxXA
 r1cgJhEnjDWef9gFKINop3NPAtHiWHGRXlMO2CjMTuwn7ElZoxqAs/nXB3O/BocByO8Z7UuUiVq2f
 /1bEz8K7lB4kskb9ZstuMlfpgKC6XzA3GFJt8JMwruIKSuIaew3sOCjtfmU0+7YAws4s=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pqw9c-0004TB-AL for kgdb-bugreport@lists.sourceforge.net;
 Mon, 24 Apr 2023 13:22:55 +0000
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-3f196e8e2c6so26677225e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Apr 2023 06:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682342566; x=1684934566;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y93RjN7osl+y397UDjyIqrYTNL58RSMeMDAuuxAAix4=;
 b=x2jKPo1RCwmsHYvqCFxsSEEx4EwxWmWv+klftRAB8GB/bm19ovlQSpV9aI3CxRwP29
 MTw59exwopOLUsQvjOodkQyjh6qSd8kEp2s4YL//lN7Okk9lOUaWiz7QaXUjaEllDn0N
 9jjeN9bWMi3PRP52zuIY6QNd9PEAmmpPPQgBWA3z+I3RRdXV0hqxbVb7g+vYRW5yYend
 rnSjvMTJrlZR8deKhXMK7w2ufG0OmCRgEO9s5hVwI4V/oMQLoB4kPpFu6+1nSg0csLD8
 FAy6i/Ddu/Rvg94XX+SqDwE8owIxJfI76cmw3WXX9eNu9IhQ0u3u9ibHm2jYGABVTGMS
 mW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682342566; x=1684934566;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y93RjN7osl+y397UDjyIqrYTNL58RSMeMDAuuxAAix4=;
 b=SWVmm/5H6i1gU0pq8bdH2zX/rSD5tsHcVXmAy3Idq4TkIK0LCJYmQx4TgwQyBlEqJi
 a7z6s9PTgoagEGd6i8FZOmZwo8vcNA1mh1Mv7DkzeFDm9oGH7Yyd48p6lBRUwXZWAfVQ
 sZYSxhi3Ul2GOpmfqBztPDokbAmkMNrh95TVyd9A19idjsjJVgAaN6cqPrkkUQhbP7bV
 26cMFR3ARn2SXFL8MWyutnyB1T73ohfXmpMtsIFtAHs64XDW+vok5IC0A8lKT1edZlSM
 YZiTfYQ2ZcCvBm05PQ/fr5obNHn3igEktxjhEPJ+bbVxzxtC8SBbb/E+AqX0KuZOG+Ga
 f0aQ==
X-Gm-Message-State: AAQBX9cnNBsJdL6Bi8ZjOfbaQ/DFId3le2eUqpnCHKC74IjSTTQqnqmX
 An7mRdQmgG/YuE+PH5hvi+hvAArFezx+T7T73FWT7JqLa9jfzQ==
X-Google-Smtp-Source: AKy350ZskqXT7f/yELNEwYyk5svk4rLkjJJaBd/6wdB6QV5y6ygNp++IlFQN/sJSnWMbL/nLJZkT5Q==
X-Received: by 2002:adf:ec86:0:b0:2f6:fb98:fa62 with SMTP id
 z6-20020adfec86000000b002f6fb98fa62mr9644645wrn.40.1682340837364; 
 Mon, 24 Apr 2023 05:53:57 -0700 (PDT)
Received: from aspen.lan ([31.221.30.162]) by smtp.gmail.com with ESMTPSA id
 h3-20020a5d5043000000b002c70ce264bfsm10695285wrt.76.2023.04.24.05.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 05:53:56 -0700 (PDT)
Date: Mon, 24 Apr 2023 13:53:55 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20230424125355.GA4054@aspen.lan>
References: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 21, 2023 at 03:53:30PM -0700, Douglas Anderson
 wrote: > From: Colin Cross <ccross@android.com> > > Implement a hardlockup
 detector that can be enabled on SMP systems > that don't have an a [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pqw9c-0004TB-AL
Subject: Re: [Kgdb-bugreport] [PATCH] hardlockup: detect hard lockups using
 secondary (buddy) cpus
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
Cc: Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexander Potapenko <glider@google.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Vlastimil Babka <vbabka@suse.cz>, Sami Tolvanen <samitolvanen@google.com>,
 kgdb-bugreport@lists.sourceforge.net, Miguel Ojeda <ojeda@kernel.org>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Marco Elver <elver@google.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Kees Cook <keescook@chromium.org>, John Ogness <john.ogness@linutronix.de>,
 Liam Howlett <liam.howlett@oracle.com>, Stephen Boyd <swboyd@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Juergen Gross <jgross@suse.com>, Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
 ito-yuichi@fujitsu.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Colin Cross <ccross@android.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Apr 21, 2023 at 03:53:30PM -0700, Douglas Anderson wrote:
> From: Colin Cross <ccross@android.com>
>
> Implement a hardlockup detector that can be enabled on SMP systems
> that don't have an arch provided one or one implemented atop perf by
> using interrupts on other cpus. Each cpu will use its softlockup
> hrtimer to check that the next cpu is processing hrtimer interrupts by
> verifying that a counter is increasing.
>
> NOTE: unlike the other hard lockup detectors, the buddy one can't
> easily provide a backtrace on the CPU that locked up. It relies on
> some other mechanism in the system to get information about the locked
> up CPUs. This could be support for NMI backtraces like [1], it could
> be a mechanism for printing the PC of locked CPUs like [2], or it
> could be something else.
>
> This style of hardlockup detector originated in some downstream
> Android trees and has been rebased on / carried in ChromeOS trees for
> quite a long time for use on arm and arm64 boards. Historically on
> these boards we've leveraged mechanism [2] to get information about
> hung CPUs, but we could move to [1].

On the Arm platforms is this code able to leverage the existing
infrastructure to extract status from stuck CPUs:
https://docs.kernel.org/trace/coresight/coresight-cpu-debug.html


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
