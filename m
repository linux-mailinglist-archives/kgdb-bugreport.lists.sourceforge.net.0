Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 926206FC7AF
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 May 2023 15:15:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pwNBr-0007bl-Cu
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 May 2023 13:15:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ak@linux.intel.com>) id 1pviBH-0002Gz-Fd
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 07 May 2023 17:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VZjhU8K9yNscHwfFIedpFnb9T5NjtGy9r4a8tOJPjGs=; b=jnowTx20NRc0e+hwPtscS4q8Fz
 y1DtrzvdRgSzfUflzFibbrw9QCoTQnTnINgDjrfWALeti3AgOdd6Mxn8DEt7fCU9g+azh3mX/MELw
 TUx3NnyyxP+DJHJ1/jqZU9wpPWAY3MJahuudjFYNoYJvQsSojBbAxq9qNYLlQuQ9s4/w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VZjhU8K9yNscHwfFIedpFnb9T5NjtGy9r4a8tOJPjGs=; b=YEbzNJ8Nt28/orjPel7w/f6Si+
 tX0xTKuXkCzGtp4ZYcVaBuJS04iF4IX5lbJT+Vp6J2KROcTfV1gbQYv+Me8zwHA8PdM9/GlPMiS9W
 QM6J69iqNnTsYXLj05SamrJwA5R6TSRM64fxaRlnpv5pODyBSgsdCftyzRFidDgs6Y/U=;
Received: from mga18.intel.com ([134.134.136.126])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pviBG-000Ayb-AS for kgdb-bugreport@lists.sourceforge.net;
 Sun, 07 May 2023 17:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683480498; x=1715016498;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xadsDlIqSLYDH8jAUQJ+rU/bh9AyzgsU04VnNDkPNZk=;
 b=WjmPMBRM1FmZ/XcBu1GWUh8K9pysiM3Jcoq/bN69H9EKj3igRsDph7Sb
 uk44zxIhwcCHZ2ypLHInX5200e1fy9L8D4oJvHnH/yzIG6xIlw85TLv0S
 9QiydYojgHfBOIqaOgUklkk6fF7UC31lC7es3kVss1VZbDHBr3ID2rIOj
 1vH5TOSduc9qQjochl+9EQtHKbm2Bfs/uhjBvE3AMo9kz6r6ZrugmXBfr
 G9uRd/36oqKKhkwOkB9ZOF02W6hNSgG0fT4rbeyYaLowIVegPnLWd3YgT
 AZrYgACv9D7YDRUtb1NH5Jx3hjlM3drFySxGvd4LtU4omyEC3WLG+g5pu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="333933241"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; d="scan'208";a="333933241"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2023 10:12:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="842466547"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; d="scan'208";a="842466547"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2023 10:12:37 -0700
Date: Sun, 7 May 2023 10:12:29 -0700
From: Andi Kleen <ak@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZFfb/bTi22RQwaol@tassilo>
References: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <CAP-5=fUB1e=bJk-w0i8+MEo4sLOZtb_Eb7FMy4u7ky7D2AZm6A@mail.gmail.com>
 <CAD=FV=Xuuefi9XBQA7z7sbe+Qw0=WeZ956gLGCoFGHBg6GBftg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=Xuuefi9XBQA7z7sbe+Qw0=WeZ956gLGCoFGHBg6GBftg@mail.gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Apr 24, 2023 at 08:23:59AM -0700,
 Doug Anderson wrote:
 > HPET system seems to have a single CPU in charge of processing the > main
 NMI and then that single CPU is in charge of checking all the [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pviBG-000Ayb-AS
X-Mailman-Approved-At: Tue, 09 May 2023 13:15:34 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Petr Mladek <pmladek@suse.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, Alexander Potapenko <glider@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Guenter Roeck <groeck@chromium.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Vlastimil Babka <vbabka@suse.cz>, Sami Tolvanen <samitolvanen@google.com>,
 kgdb-bugreport@lists.sourceforge.net, Miguel Ojeda <ojeda@kernel.org>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
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


On Mon, Apr 24, 2023 at 08:23:59AM -0700, Doug Anderson wrote:
> HPET system seems to have a single CPU in charge of processing the
> main NMI and then that single CPU is in charge of checking all the
> others. If that single CPU goes out to lunch then the system couldn't
> detect hard lockups.
> 
> In any case, I'm happy to let others debate about the HPET system. For
> now, I'll take my action items to be:

We don't really seem to make any progress on the HPET series, so even
if it is better in some way a series that is never merged is always
worse than one that is.

My experience is that cases where everything locks up are very rare.
I suspect as long as we cover the garden variety single CPU lockup case well
it is likely very diminishing returns to handle more complex cases. So whatever
gets the job done is fine.

Yes freeing the Perfmon resources is big advantage of either.

-Andi



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
